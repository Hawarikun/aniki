// ignore_for_file: non_constant_identifier_names

import 'package:aniki/core/data/sqflite/bookmark_database.dart';
import 'package:aniki/core/domain/bookmark.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookmarkRepository {
  BookmarkRepository(this._db);

  final BookmarkDatabase _db;

  // Mendapatkan daftar bookmark dari database
  Future<List<Bookmark>> getBookmarks() async {
    try {
      return await _db.getBookmarks();
    } catch (e) {
      throw Exception("Failed to fetch bookmarks: $e");
    }
  }

  // Menambahkan bookmark ke database
  Future insert(Bookmark bookmark) async {
    try {
      await _db.insert(bookmark);
    } catch (e) {
      throw Exception("Failed to insert bookmark: $e");
    }
  }

  Future getBookmarkById(int mal_id) async {
    try {
      return await _db.getBookmarkById(mal_id);
    } catch (e) {
      throw Exception("Failed to insert bookmark: $e");
    }
  }

  Future removeBookmarkById(int mal_id) async {
    try {
      return await _db.delete(mal_id);
    } catch (e) {
      throw Exception("Failed to insert bookmark: $e");
    }
  }
}

// Provider untuk BookmarkRepository
final bookmarkRepoProv = Provider<BookmarkRepository>((ref) {
  final db = BookmarkDatabase();
  return BookmarkRepository(db);
});
