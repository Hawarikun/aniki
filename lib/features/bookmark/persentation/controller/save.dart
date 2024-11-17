// ignore_for_file: non_constant_identifier_names

import 'package:aniki/core/domain/bookmark.dart';
import 'package:aniki/features/bookmark/data/bookmark.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SaveBookmarkController extends StateNotifier<AsyncValue> {
  SaveBookmarkController(this._repo, {required this.params})
      : super(const AsyncValue.loading()) {
    saveBookmark();
  }

  final BookmarkRepository _repo;
  final SaveBookmarkParams params;

  Future saveBookmark() async {
    state = const AsyncValue.loading();
    try {
      final response = await _repo.insert(params.bookmark);
      state = AsyncValue.data(response);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }
}

class SaveBookmarkParams extends Equatable {
  final Bookmark bookmark;

  const SaveBookmarkParams({
    required this.bookmark,
  });

  @override
  List<Object?> get props => [bookmark];
}

final saveBookmarkControllerProv = AutoDisposeStateNotifierProviderFamily<
    SaveBookmarkController, AsyncValue, SaveBookmarkParams>(
  (ref, params) {
    final repo = ref.read(bookmarkRepoProv);
    return SaveBookmarkController(repo, params: params);
  },
);
