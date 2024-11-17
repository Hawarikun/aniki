// ignore_for_file: non_constant_identifier_names

import 'package:aniki/core/domain/bookmark.dart';
import 'package:sqflite/sqflite.dart';

class BookmarkDatabase {
  // ignore: unused_element
  Future<Database> _initDatabase() async {
    final database = await openDatabase(
      'bookmark.db',
      version: 1,
      onCreate: (db, version) async {
        await db.execute("""CREATE TABLE bookmark(
            mal_id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            score NUMERIC,
            image TEXT
          ) """);
      },
    );

    return database;
  }

  Future insert(Bookmark bookmark) async {
    final data = bookmark.toJson();

    final db = await _initDatabase();
    final id = await db.insert(
      "bookmark",
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return id;
  }

  Future<List<Bookmark>> getBookmarks() async {
    final db = await _initDatabase();

    final result = await db.query("bookmark");

    return result.map((e) => Bookmark.fromJson(e)).toList();
  }

  Future getBookmarkById(int mal_id) async {
    final db = await _initDatabase();
    final result = await db.query(
      "bookmark",
      where: "mal_id = ?",
      whereArgs: [mal_id],
      limit: 1
    );

    return result.map((result) => Bookmark.fromJson(result)).toList();
  }

  Future delete(int id) async {
    final db = await _initDatabase();

    await db.delete(
      "bookmark",
      where: "mal_id = ?",
      whereArgs: [id],
    );
  }

  Future deleteAll() async {
    final db = await _initDatabase();

    await db.delete(
      "bookmark",
    );
  }
}
