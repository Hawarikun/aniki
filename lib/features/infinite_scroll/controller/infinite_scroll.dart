import 'package:aniki/core/apis/search.dart';
import 'package:aniki/core/apis/seasons.dart';
import 'package:aniki/core/apis/top_anime.dart';
import 'package:aniki/core/domain/anime.dart';
import 'package:aniki/features/infinite_scroll/view/infinite_fragment.dart';
import 'package:aniki/features/ongoing/data/ongoing.dart';
import 'package:aniki/features/search/data/search.dart';
import 'package:aniki/features/top/data/top_anime.dart';
import 'package:aniki/pages/more_anime.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class InfiniteScrollController extends StateNotifier<List<Anime>> {
  InfiniteScrollController(this.params, this.pagingController, this.typeAnime)
      : super([]) {
    fetchPage(params.pageKey);
  }

  final InfiniteScrollParams params;
  final PagingController pagingController;
  final String typeAnime;

  Future<void> fetchPage(int pageKey) async {
    try {
      List<Anime> newItems = [];

      if (typeAnime == 'ongoing') {
        newItems = await OngoingRepository(SeasonApi()).index(
          continuing: params.continuing,
          page: pageKey,
          limit: 25,
          type: params.type,
        );
      } else if (typeAnime == 'top') {
        newItems = await TopAnimeRepository(TopAnimeApi())
            .index(page: pageKey, limit: 25);
      } else {
        newItems = await SearchAnimeRepository(SearchApi()).index(
          query: params.query,
          page: pageKey,
          genre: params.genres!.map((genres) => genres).join(','),
          orderby: params.orderby,
          status: params.status,
          type: params.type,
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
}

class InfiniteScrollParams extends Equatable {
  final bool? continuing;
  final int pageKey;
  final String? query;
  final List<int>? genres;
  final String? orderby;
  final String? status;
  final String? type;

  const InfiniteScrollParams({
    this.continuing,
    required this.pageKey,
    this.query,
    this.genres,
    this.orderby,
    this.status,
    this.type,
  });

  @override
  List<Object?> get props => [
        continuing,
        pageKey,
        query,
        genres,
        orderby,
        status,
        type,
      ];
}

final infiniteMoreControllerProv = AutoDisposeStateNotifierProviderFamily<
    InfiniteScrollController, List<Anime>, InfiniteScrollParams>(
  (ref, params) {
    final type = ref.watch(typeAnimeProvider);
    final pagingController = ref.read(pagingControllerProvider);
    return InfiniteScrollController(params, pagingController, type);
  },
);
