import 'package:aniki/core/domain/anime.dart';
import 'package:aniki/features/ongoing/data/ongoing.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OngoingController extends StateNotifier<AsyncValue<List<Anime>>> {
  OngoingController(this.repo, this.params)
      : super(const AsyncValue.loading()) {
    index();
  }

  final OngoingRepository repo;
  final OngoingParams params;

  Future index() async {
    state = const AsyncValue.loading();
    try {
      final response = await repo.index(
        continuing: params.continuing,
        page: params.page,
        limit: params.limit,
        type: params.type,
      );
      state = AsyncValue.data(response);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }
}

class OngoingParams extends Equatable {
  const OngoingParams({
    this.continuing,
    this.limit,
    this.page,
    this.type,
  });

  final bool? continuing;
  final int? page;
  final int? limit;
  final String? type;

  @override
  List<Object?> get props => [continuing, page, limit, type];
}

final ongoingControllerProv = AutoDisposeStateNotifierProviderFamily<
    OngoingController, AsyncValue<List<Anime>>, OngoingParams>(
  (ref, params) {
    final repository = ref.read(ongoingRepoProv);
    return OngoingController(repository, params);
  },
);
