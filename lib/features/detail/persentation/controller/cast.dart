import 'package:aniki/core/domain/cast.dart';
import 'package:aniki/features/detail/data/cast.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnimeCastController extends StateNotifier<AsyncValue<List<AnimeCast>>> {
  AnimeCastController(this._repo, this.params)
      : super(const AsyncValue.loading()) {
    index();
  }

  final AnimeCastRevository _repo;
  final AnimeCastParams params;

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

class AnimeCastParams extends Equatable {
  const AnimeCastParams({required this.id});
  final String id;

  @override
  List<Object?> get props => [id];
}

final animeCastControllerProv = AutoDisposeStateNotifierProviderFamily<
    AnimeCastController, AsyncValue<List<AnimeCast>>, AnimeCastParams>((
  ref,
  params,
) {
  final repo = ref.read(animeCastRepoProv);
  return AnimeCastController(repo, params);
});
