// ignore_for_file: file_names

import 'package:aniki/core/domain/anime.dart';

List<Genre> genres = [
  Genre(mal_id: 1, name: "Action"),
  Genre(mal_id: 2, name: "Adventure"),
  Genre(mal_id: 4, name: "Comedy"),
  Genre(mal_id: 8, name: "Drama"),
  Genre(mal_id: 9, name: "Ecchi"),
  Genre(mal_id: 10, name: "Fantasy"),
  Genre(mal_id: 14, name: "Horror"),
  Genre(mal_id: 35, name: "Harem"),
  Genre(mal_id: 13, name: "Historical"),
  Genre(mal_id: 62, name: "Isekai"),
  Genre(mal_id: 43, name: "Josei"),
  Genre(mal_id: 17, name: "Material Arts"),
  Genre(mal_id: 18, name: "Mecha"),
  Genre(mal_id: 38, name: "Military"),
  Genre(mal_id: 19, name: "Music"),
  Genre(mal_id: 7, name: "Mystery"),
  Genre(mal_id: 22, name: "Romance"),
  Genre(mal_id: 42, name: "Seinen"),
  Genre(mal_id: 16, name: "School"),
  Genre(mal_id: 24, name: "Sci-Fi"),
  Genre(mal_id: 25, name: "Shoujo"),
  Genre(mal_id: 27, name: "Shounen"),
  Genre(mal_id: 36, name: "Slice of Life"),
  Genre(mal_id: 20, name: "Parody"),
  Genre(mal_id: 18, name: "Supernatural"),
  Genre(mal_id: 30, name: "Sports"),
  Genre(mal_id: 40, name: "Psychological"),
  Genre(mal_id: 19, name: "Tragedy"),
  Genre(mal_id: 32, name: "Vampire"),
];

List<String> types = <String>[
  "tv",
  "movie",
  "ova",
  "special",
  "ona",
  "music",
];

List<String> days = [
  "Sundays",
  "Mondays",
  "Tuesdays",
  "Wednesdays",
  "Thursdays",
  "Fridays",
  "Saturdays",
];


List<String> status = [
  "all",
  "airing",
  "complete",
  "upcoming",
];

List<String> type = [
  "all",
  "tv",
  "movie",
  "ova",
  "special",
  "ona",
  "music",
];

List<String> order = [
  "Relevance",
  "A-Z",
  "Z-A",
  "last updated",
  "last added",
  "popularity",
];
