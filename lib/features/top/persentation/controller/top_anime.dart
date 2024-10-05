import 'package:aniki/core/domain/anime.dart';
import 'package:aniki/features/top/data/top_anime.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopAnimeController extends StateNotifier<AsyncValue<List<Anime>>> {
  TopAnimeController(this.repo, this.params)
      : super(const AsyncValue.loading()) {
    index();
  }

  final TopAnimeRepository repo;
  final TopAnimeParams params;

  Future index() async {
    state = const AsyncValue.loading();
    try {
      final response = await repo.index(
        page: params.page,
        limit: params.limit,
      );
      state = AsyncValue.data(response);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }
}

class TopAnimeParams extends Equatable {
  const TopAnimeParams({
    this.page,
    this.limit,
  });

  final int? page;
  final int? limit;
  @override
  List<Object?> get props => [page, limit];
}

final topAnimeControllerProv = AutoDisposeStateNotifierProviderFamily<
    TopAnimeController, AsyncValue<List<Anime>>, TopAnimeParams>((ref, params) {
  final repository = ref.read(topAnimeRepoProv);
  return TopAnimeController(
    repository,
    params,
  );
});
