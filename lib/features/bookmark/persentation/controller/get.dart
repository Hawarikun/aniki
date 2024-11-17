import 'package:aniki/core/domain/bookmark.dart';
import 'package:aniki/features/bookmark/data/bookmark.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetBookmarkController extends StateNotifier<AsyncValue<List<Bookmark>>> {
  GetBookmarkController(this._repo) : super(const AsyncValue.loading()) {
    getBookmark();
  }

  final BookmarkRepository _repo;

  Future getBookmark() async {
    state = const AsyncValue.loading();
    try {
      final response = await _repo.getBookmarks();
      state = AsyncValue.data(response);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }
}

final getBookmarkControllerProvider = AutoDisposeStateNotifierProvider<
    GetBookmarkController, AsyncValue<List<Bookmark>>>((ref) {
  final repo = ref.read(bookmarkRepoProv);
  return GetBookmarkController(repo);
});
