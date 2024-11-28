import 'package:aniki/core/domain/anime.dart';
import 'package:aniki/features/seasons/data/upcoming.dart';
import 'package:aniki/features/seasons/persentation/view/upcoming_seasons.dart';
import 'package:aniki/widgets/buttons/dropdown.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class UpcomingAnimeController extends StateNotifier<List<Anime>> {
  UpcomingAnimeController(this.repo, this.params, this.controller, this.type)
      : super([]) {
    fetchPage(params.pageKey);
  }

  final UpcomingRepository repo;
  final UpcomingAnimeParams params;

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

class UpcomingAnimeParams extends Equatable {
  final int pageKey;

  const UpcomingAnimeParams({
    required this.pageKey,
  });

  @override
  List<Object?> get props => [pageKey];
}

final upcomingAnimeConProv = AutoDisposeStateNotifierProviderFamily<
    UpcomingAnimeController, List<Anime>, UpcomingAnimeParams>(
  (ref, params) {
    final repo = ref.read(upcomingRepoProv);
    final controller = ref.watch(upcomingPagingControllerProv);
    final ddValue = ref.read(ddValueProvider);

    return UpcomingAnimeController(repo, params, controller, ddValue);
  },
);
