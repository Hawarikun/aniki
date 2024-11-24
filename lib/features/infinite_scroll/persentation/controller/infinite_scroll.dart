import 'package:aniki/core/apis/ongoing.dart';
import 'package:aniki/core/apis/search.dart';
import 'package:aniki/core/apis/top_anime.dart';
import 'package:aniki/core/domain/anime.dart';
import 'package:aniki/features/infinite_scroll/persentation/view/infinite_scroll.dart';
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
    pagingController.addPageRequestListener((pageKey) {
      fetchPage(pageKey);
    });
  }

  final InfiniteScrollParams params;
  final PagingController pagingController;
  final String typeAnime;

  Future<void> fetchPage(int pageKey) async {
    try {
      List<Anime> newItems = [];

      

      if (typeAnime == 'ongoing') {
        newItems = await OngoingRepository(OngoingApi())
            .index(page: pageKey, limit: 25);
        
      } else if (typeAnime == 'top') {
        newItems = await TopAnimeRepository(TopAnimeApi())
            .index(page: pageKey, limit: 25);
        
      } else {
        newItems = await SearchAnimeRepository(SearchApi()).index(
          query: params.query,
          page: pageKey,
          genre: params.gendre,
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
  final String? query;
  final String? gendre;
  final String? orderby;
  final String? status;
  final String? type;

  const InfiniteScrollParams({
    this.query,
    this.gendre,
    this.orderby,
    this.status,
    this.type,
  });

  @override
  List<Object?> get props => [
        query,
        gendre,
        orderby,
        status,
        type,
      ];
}

/// for search
final infiniteSearchControllerProv = AutoDisposeStateNotifierProviderFamily<
    InfiniteScrollController, List<Anime>, InfiniteScrollParams>(
  (ref, params) {
    final pagingController = ref.read(pagingControllerProvider);
    final type = ref.watch(typeAnimeProvider);

    return InfiniteScrollController(params, pagingController, type);
  },
);

/// for more page
final infiniteMoreControllerProv = AutoDisposeStateNotifierProviderFamily<
    InfiniteScrollController, List<Anime>, InfiniteScrollParams>(
  (ref, params) {
    final type = ref.watch(typeAnimeProvider);
    final pagingController = ref.read(pagingControllerProvider);
    return InfiniteScrollController(params, pagingController, type);
  },
);
