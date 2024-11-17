// ignore_for_file: non_constant_identifier_names

import 'package:aniki/features/bookmark/data/bookmark.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RemoveBookmarkController extends StateNotifier<AsyncValue> {
  RemoveBookmarkController(this._repo, this.params) : super(const AsyncValue.loading()){
    removeBookmark();
  }
  
  final BookmarkRepository _repo;
  final RemoveBookmarkParams params;
  
  Future removeBookmark() async {
    state = const AsyncValue.loading();
    try {
      final response = await _repo.removeBookmarkById(params.mal_id);
      state = AsyncValue.data(response);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }
}

class RemoveBookmarkParams extends Equatable {
  final int mal_id;
  
  const RemoveBookmarkParams({required this.mal_id});
  
  @override
  List<Object?> get props => [mal_id];
}

final removeBookmarkControllerprov = AutoDisposeStateNotifierProviderFamily<
    RemoveBookmarkController, AsyncValue, RemoveBookmarkParams>(
  (ref, params) {
    final repo = ref.read(bookmarkRepoProv);
    return RemoveBookmarkController(repo, params);
  },
);