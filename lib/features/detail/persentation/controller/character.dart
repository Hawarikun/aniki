import 'package:aniki/core/domain/character.dart';
import 'package:aniki/features/detail/data/character.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnimeCharController extends StateNotifier<AsyncValue<List<AnimeChar>>> {
  AnimeCharController(this._repo, this.params)
      : super(const AsyncValue.loading()) {
    index();
  }

  final AnimeCharacterRevository _repo;
  final AnimeCharParams params;

  Future index() async {
    state = const AsyncValue.loading();
    try {
      final response = await _repo.index(id: params.id);
      state = AsyncValue.data(response);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }
}

class AnimeCharParams extends Equatable {
  const AnimeCharParams({required this.id});
  final String id;

  @override
  List<Object?> get props => [id];
}

final animeCharControllerProv = AutoDisposeStateNotifierProviderFamily<
    AnimeCharController, AsyncValue<List<AnimeChar>>, AnimeCharParams>((
  ref,
  params,
) {
  final repo = ref.read(animeCharRepoProv);
  return AnimeCharController(repo, params);
});
