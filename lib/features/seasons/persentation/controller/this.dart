import 'package:aniki/core/domain/anime.dart';
import 'package:aniki/features/ongoing/data/ongoing.dart';
import 'package:aniki/features/seasons/persentation/view/this_seasons.dart';
import 'package:aniki/widgets/buttons/dropdown.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ThisSeasonAnimeController extends StateNotifier<List<Anime>> {
  ThisSeasonAnimeController(this.repo, this.params, this.controller, this.type)
      : super([]) {
    fetchPage(params.pageKey);
  }

  final OngoingRepository repo;
  final ThisSeasonAnimeParams params;

  final PagingController controller;
  final String type;

  Future<void> fetchPage(int pageKey) async {
    try {
      List<Anime> newItems = [];

      newItems = await repo.index(
        continuing: false,
        page: pageKey,
        limit: 25,
        type: type,
      );

      final isLastPage = newItems.length < 24;
      if (isLastPage) {
        controller.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        controller.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      controller.error = error;
    }
  }
}

class ThisSeasonAnimeParams extends Equatable {
  final int pageKey;

  const ThisSeasonAnimeParams({
    required this.pageKey,
  });

  @override
  List<Object?> get props => [pageKey];
}

final thisSeasonAnimeConProv = AutoDisposeStateNotifierProviderFamily<
    ThisSeasonAnimeController, List<Anime>, ThisSeasonAnimeParams>(
  (ref, params) {
    final repo = ref.read(ongoingRepoProv);
    final controller = ref.watch(thisSeasonPagingControllerProv);
    final ddValue = ref.read(ddValueProvider);

    return ThisSeasonAnimeController(repo, params, controller, ddValue);
  },
);
