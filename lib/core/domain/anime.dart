import 'package:json_annotation/json_annotation.dart';

part 'annatation/anime.g.dart';

@JsonSerializable(explicitToJson: true)
class Anime {
  int id;
  String url;
  String images;
  Trailer? trailer;
  String title;
  String? titleEnglish;
  String? titleJapanese;
  String type;
  String source;
  int? episodes;
  String status;
  String? duration;
  String? rating;
  double? score;
  String? synopsis;
  String background;
  String? season;
  int? year;
  List<Studios> studios;
  List<Genre> genres;
  String? aried;

  Anime({
    required this.id,
    required this.url,
    required this.images,
    this.trailer,
    required this.title,
    // this.titleEnglish,
    // this.titleJapanese,
    required this.type,
    required this.source,
    this.episodes,
    required this.status,
    this.duration,
    this.rating,
    this.score,
    this.synopsis,
    required this.background,
    this.season,
    this.year,
    required this.studios,
    required this.genres,
    this.aried
  });
  factory Anime.fromJson(Map<String, dynamic> map) => _$AnimeFromJson(map);

  Map<String, dynamic> toJson() => _$AnimeToJson(this);
}

@JsonSerializable()
class Genre {
  int malId;
  String name;

  Genre({
    required this.malId,
    required this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> map) => _$GenreFromJson(map);

  Map<String, dynamic> toJson() => _$GenreToJson(this);
}

@JsonSerializable()
class Trailer {
  String? youtubeId;
  String? url;
  String? embedUrl;
  String? images;

  Trailer({
    this.youtubeId,
    this.url,
    this.embedUrl,
    this.images,
  });

  factory Trailer.fromJson(Map<String, dynamic> map) => _$TrailerFromJson(map);

  Map<String, dynamic> toJson() => _$TrailerToJson(this);
}

@JsonSerializable()
class Studios {
  int malId;
  String type;
  String name;
  String url;

  Studios({
    required this.malId,
    required this.type,
    required this.name,
    required this.url,
  });

  factory Studios.fromJson(Map<String, dynamic> map) => _$StudiosFromJson(map);

  Map<String, dynamic> toJson() => _$StudiosToJson(this);
}