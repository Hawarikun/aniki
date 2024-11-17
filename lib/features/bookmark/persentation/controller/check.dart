// ignore_for_file: non_constant_identifier_names

import 'package:aniki/features/bookmark/data/bookmark.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CheckBookmarkController extends StateNotifier<AsyncValue> {
  CheckBookmarkController(this._repository, this.params)
      : super(const AsyncValue.loading()) {
    checkBookmark();
  }

  final BookmarkRepository _repository;
  final CheckBookmarkParams params;

  Future checkBookmark() async {
    state = const AsyncValue.loading();
    try {
      final response = await _repository.getBookmarkById(params.mal_id);
      state = AsyncValue.data(response);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }
}

class CheckBookmarkParams extends Equatable {
  final int mal_id;

  const CheckBookmarkParams({required this.mal_id});

  @override
  List<Object?> get props => [mal_id];
}

final checkBookmarkControllerProvider = AutoDisposeStateNotifierProviderFamily<
    CheckBookmarkController, AsyncValue, CheckBookmarkParams>(
  (ref, params) {
    final repo = ref.read(bookmarkRepoProv);
    return CheckBookmarkController(repo, params);
  },
);
