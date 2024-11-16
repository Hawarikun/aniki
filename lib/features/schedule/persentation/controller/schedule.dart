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

  Future index() async {
    state = const AsyncValue.loading();
    try {
      final response = await repo.index(params.day);
      state = AsyncValue.data(response);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }
}

class ScheduleParams extends Equatable {
  const ScheduleParams({required this.day});

  final String day;

  @override
  List<Object?> get props => [day];
}

final scheduleControllerProv = AutoDisposeStateNotifierProviderFamily<
    ScheduleAnimeController, AsyncValue<List<Anime>>, ScheduleParams>(
  (ref, params) {
    final repository = ref.read(scheduleAnimeRepoProv);
    return ScheduleAnimeController(repository, params);
  },
);
