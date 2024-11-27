import 'package:aniki/core/domain/news.dart';
import 'package:aniki/features/detail/data/news.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnimeNewsController extends StateNotifier<AsyncValue<List<News>>> {
  AnimeNewsController(this._repo, this.params)
      : super(const AsyncValue.loading()) {
    index();
  }

  final NewsRepository _repo;
  final AnimeNewsParams params;

  Future index() async {
    state = const AsyncValue.loading();
    try {
      final response = await _repo.getNews(params.id);
      state = AsyncValue.data(response);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }
}

class AnimeNewsParams extends Equatable {
  const AnimeNewsParams(this.id);
  final String id;

  @override
  List<Object> get props => [id];
}

final animeNewsControllerProv = AutoDisposeStateNotifierProviderFamily<
    AnimeNewsController, AsyncValue<List<News>>, AnimeNewsParams>(
  (ref, params) {
    final repo = ref.read(newsRepoProv);
    return AnimeNewsController(repo, params);
  },
);
