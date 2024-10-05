import 'package:aniki/core/domain/anime.dart';
import 'package:aniki/features/search/data/search.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchAnimeController extends StateNotifier<AsyncValue<List<Anime>>> {
  SearchAnimeController(this.repo, this.params)
      : super(const AsyncValue.loading()) {
        index();
      }

  final SearchAnimeRepository repo;
  final SearchAnimeParams params;

  Future index() async {
    state = const AsyncValue.loading();
    try {
      final response = await repo.index(
        query: params.query,
        gendre: params.gendre,
        orderby: params.orderby,
        status: params.status,
        type: params.type,
      );
      state = AsyncValue.data(response);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }
}

class SearchAnimeParams extends Equatable {
  const SearchAnimeParams({
    this.query,
    this.gendre,
    this.orderby,
    this.status,
    this.type,
    this.page,
  });
  final String? query;
  final String? gendre;
  final String? orderby;
  final String? status;
  final String? type;
  final String? page;

  @override
  List<Object?> get props => [query, gendre, orderby, status, type];
}

final searchControllerProv = AutoDisposeStateNotifierProviderFamily<
    SearchAnimeController, AsyncValue<List<Anime>>, SearchAnimeParams>(
  (ref, params) {
    final repository = ref.read(searchAnimeRepoProv);
    return SearchAnimeController(
      repository,
      params,
    );
  },
);
