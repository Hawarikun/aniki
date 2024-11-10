import 'package:aniki/core/domain/review.dart';
import 'package:aniki/features/detail/data/review.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnimeReviewController extends StateNotifier<AsyncValue<List<Review>>> {
  AnimeReviewController(this._repo, this.params)
      : super(const AsyncValue.loading()) {
    index();
  }

  final ReviewRepository _repo;
  final AnimeReviewParams params;

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

class AnimeReviewParams extends Equatable {
  const AnimeReviewParams(this.id);

  final String id;

  @override
  List<Object?> get props => [id];
}

final animeReviewControllerProv = AutoDisposeStateNotifierProviderFamily<
    AnimeReviewController, AsyncValue<List<Review>>, AnimeReviewParams>(
  (ref, params) {
    final repo = ref.read(reviewRepoProv);
    return AnimeReviewController(repo, params);
  },
);
