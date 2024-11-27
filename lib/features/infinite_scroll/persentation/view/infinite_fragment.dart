import 'package:aniki/core/apis/ongoing.dart';
import 'package:aniki/core/apis/search.dart';
import 'package:aniki/core/apis/top_anime.dart';
import 'package:aniki/core/domain/anime.dart';
import 'package:aniki/core/dummys/enum.dart';
import 'package:aniki/features/infinite_scroll/persentation/view/grid_infinite_scroll.dart';
import 'package:aniki/features/infinite_scroll/persentation/view/tile_infinite_scroll.dart';
import 'package:aniki/features/ongoing/data/ongoing.dart';
import 'package:aniki/features/search/data/search.dart';
import 'package:aniki/features/search/persentation/view/filter.dart';
import 'package:aniki/features/search/persentation/view/search.dart';
import 'package:aniki/features/top/data/top_anime.dart';
import 'package:aniki/pages/more_anime.dart';
import 'package:aniki/widgets/buttons/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

final pagingControllerProvider =
    StateProvider.autoDispose<PagingController<int, Anime>>((ref) {
  return PagingController(firstPageKey: 1);
});

class InfiniteScrollFragment extends ConsumerStatefulWidget {
  const InfiniteScrollFragment({
    super.key,
    required this.typeCard,
  });

  final TypeCard typeCard;

  @override
  InfiniteScrollFragmentState createState() => InfiniteScrollFragmentState();
}

class InfiniteScrollFragmentState
    extends ConsumerState<InfiniteScrollFragment> {
  @override
  void initState() {
    super.initState();
    final pagingController = ref.read(pagingControllerProvider);
    pagingController.addPageRequestListener((pageKey) {
      fetchPage(pageKey);
    });
  }

  Future<void> fetchPage(int pageKey) async {
    final searchController = ref.read(searchControllerProvider);
    final genres = ref.read(genresProvider);
    final type = ref.read(typeProvider);
    final ddValue = ref.read(ddValueProvider);
    final orderBy = ref.read(orderByProvider);
    final status = ref.read(statusProvider);
    final typeAnime = ref.watch(typeAnimeProvider);
    final pagingController = ref.watch(pagingControllerProvider);

    try {
      List<Anime> newItems = [];

      if (typeAnime == 'ongoing' || typeAnime == 'season') {
        newItems = await OngoingRepository(OngoingApi()).index(
          continuing: typeAnime == 'ongoing' ? true : false,
          page: pageKey,
          limit: 25,
          type: ddValue,
        );
      } else if (typeAnime == 'top') {
        newItems = await TopAnimeRepository(TopAnimeApi())
            .index(page: pageKey, limit: 25);
      } else {
        newItems = await SearchAnimeRepository(SearchApi()).index(
          query: searchController.text,
          page: pageKey,
          genre: genres.map((genres) => genres).join(','),
          orderby: orderBy,
          status: status,
          type: type,
        );
      }

      final isLastPage = newItems.length < 24;
      if (isLastPage) {
        pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.typeCard == TypeCard.tile
        ? const TileInfiniteScrollFragment()
        : const GridInfiniteScrollFragment();
  }
}
