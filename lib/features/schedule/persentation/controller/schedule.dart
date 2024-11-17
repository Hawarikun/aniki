import 'package:aniki/core/domain/anime.dart';
import 'package:aniki/features/schedule/data/schedule.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScheduleAnimeController extends StateNotifier<AsyncValue<List<Anime>>> {
  ScheduleAnimeController(this.repo, this.params)
      : super(const AsyncValue.loading()) {
    index();
  }

  final ScheduleAnimeRepository repo;
  final ScheduleParams params;

  bool _isFatching = false;
  bool _hasMore = true;

  // Future index() async {
  //   state = const AsyncValue.loading();
  //   try {
  //     final response = await repo.index(params.page, params.limit);
  //     state = AsyncValue.data(response);
  //   } catch (e, s) {
  //     state = AsyncValue.error(e, s);
  //   }
  // }

  Future index() async {
    if (_isFatching || !_hasMore) return;

    _isFatching = true;

    try {
      final response = await repo.index(params.page, params.limit);
      final currentData = state.value ?? [];
      final newData = [...currentData, ...response];

      state = AsyncValue.data(newData);

      _hasMore = response.length == params.limit;

      if (_hasMore) {
        params.page++;
      }
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    } finally {
      _isFatching = false;
    }
  }

  Future nextPage() {
    if (params.page == 2) {
      Future.delayed(const Duration(seconds: 1), () => index());
    }

    return index();
  }
}

// ignore: must_be_immutable
class ScheduleParams extends Equatable {
  ScheduleParams({required this.page, required this.limit});

  int page;
  int limit;

  @override
  List<Object?> get props => [limit, page];
}

final scheduleControllerProv = AutoDisposeStateNotifierProviderFamily<
    ScheduleAnimeController, AsyncValue<List<Anime>>, ScheduleParams>(
  (ref, params) {
    final repository = ref.read(scheduleAnimeRepoProv);
    return ScheduleAnimeController(repository, params);
  },
);
