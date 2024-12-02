import 'package:aniki/core/domain/anime.dart';
import 'package:aniki/features/seasons/data/season.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class SeasonAnimeController extends StateNotifier<List<Anime>> {
  SeasonAnimeController(this.repo, this.params)
      : super([]) {
    getSeasonAnime(params.page);
  }

  final SeasonRepository repo;
  final SeasonParams params;

  Future getSeasonAnime(int pageKey) async {
    try {
      List<Anime> newItems = [];

      newItems = await repo.getAnimeSeasons(
        year: params.year,
        seasons: params.seasons,
        continuing: false,
        page: pageKey,
        limit: params.limit,
        type: params.type,
      );

      final isLastPage = newItems.length < 24;
      if (isLastPage) {
        params.controller.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        params.controller.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      params.controller.error = error;
    }
  }
}

class SeasonParams extends Equatable {
  final PagingController controller;
  final int year;
  final String seasons;
  final int page;
  final int? limit;
  final bool? continuing;
  final String? type;
  

  const SeasonParams({
    required this.controller,
    required this.year,
    required this.seasons,
    required this.page,
    this.limit,
    this.continuing,
    this.type,
  });

  @override
  List<Object?> get props => [controller, year, seasons, page, limit, continuing, type];
}

final seasonAnimeControllerProv = AutoDisposeStateNotifierProviderFamily<
    SeasonAnimeController, List<Anime>, SeasonParams>(
  (ref, params) {
    final repo = ref.read(seasonsRepoProv);
    return SeasonAnimeController(repo, params);
  },
);