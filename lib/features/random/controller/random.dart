import 'package:aniki/core/domain/anime.dart';
import 'package:aniki/features/random/data/random.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RandomAnimeController extends StateNotifier<AsyncValue<Anime>> {
  RandomAnimeController(this.repo) : super(const AsyncValue.loading()) {
    random();
  }

  final RandomAnimeRepository repo;

  Future random() async {
    state = const AsyncValue.loading();
    try {
      final response = await repo.index();
      state = AsyncValue.data(response);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }
}

final randomControllerProv =
    AutoDisposeStateNotifierProvider<RandomAnimeController, AsyncValue<Anime>>(
  (ref) {
    final repostory = ref.read(randomAnimeRepoProv);

    return RandomAnimeController(repostory);
  },
);
