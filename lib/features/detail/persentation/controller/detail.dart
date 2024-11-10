import 'package:aniki/core/domain/anime.dart';
import 'package:aniki/features/detail/data/detail.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnimeDetailController extends StateNotifier<AsyncValue<Anime>> {
  AnimeDetailController(this.repo, this.params)
      : super(const AsyncValue.loading()) {
    detail();
  }

  final AnimeDetailRepository repo;
  final AnimeDetailParams params;

  Future detail() async {
    state = const AsyncValue.loading();
    try {
      final response = await repo.detail(animeId: params.animeId);
      state = AsyncValue.data(response);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }
}

class AnimeDetailParams extends Equatable {
  const AnimeDetailParams({
    required this.animeId,
  });

  final String animeId;

  @override
  List<Object?> get props => [animeId];
}

final animeDetailControllerProv = AutoDisposeStateNotifierProviderFamily<
    AnimeDetailController, AsyncValue<Anime>, AnimeDetailParams>(
  (
    ref,
    params,
  ) {
    final repo = ref.read(animeDetailRepoProv);
    return AnimeDetailController(repo, params);
  },
);
