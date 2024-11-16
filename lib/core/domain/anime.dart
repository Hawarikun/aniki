// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'anime.g.dart';

@JsonSerializable(explicitToJson: true)
class Anime {
  final int mal_id;
  final String url;
  final Images images;
  final Trailer trailer;
  final String title;
  final String? title_english;
  final String? title_japanese;
  final String type;
  final String source;
  final int? episodes;
  final String status;
  final String? duration;
  final String? rating;
  final double? score;
  final String? synopsis;
  final String? background;
  final String? season;
  final int? year;
  final List<Studios>? studios;
  final List<Genre> genres;
  final Aired aired;

  Anime({
    required this.mal_id,
    required this.url,
    required this.images,
    required this.trailer,
    required this.title,
    this.title_english,
    this.title_japanese,
    required this.type,
    required this.source,
    this.episodes,
    required this.status,
    this.duration,
    this.rating,
    this.score,
    this.synopsis,
    this.background,
    this.season,
    this.year,
    required this.studios,
    required this.genres,
    required this.aired,
  });

  factory Anime.fromJson(Map<String, dynamic> json) => _$AnimeFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeToJson(this);
}

@JsonSerializable()
class Images {
  Jpg? jpg;
  Webp? webp;

  Images({
    required this.jpg,
    required this.webp,
  });

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesToJson(this);
}

@JsonSerializable()
class Jpg {
  String? image_url;
  String? small_image_url;
  String? large_image_url;

  Jpg({
    required this.image_url,
    required this.small_image_url,
    required this.large_image_url,
  });

  factory Jpg.fromJson(Map<String, dynamic> json) => _$JpgFromJson(json);

  Map<String, dynamic> toJson() => _$JpgToJson(this);
}

@JsonSerializable()
class Webp {
  String? image_url;
  String? small_image_url;
  String? large_image_url;

  Webp({
    required this.image_url,
    required this.small_image_url,
    required this.large_image_url,
  });

  factory Webp.fromJson(Map<String, dynamic> json) => _$WebpFromJson(json);

  Map<String, dynamic> toJson() => _$WebpToJson(this);
}

@JsonSerializable()
class Genre {
  final int mal_id;
  final String name;

  Genre({
    required this.mal_id,
    required this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  Map<String, dynamic> toJson() => _$GenreToJson(this);
}

@JsonSerializable()
class Trailer {
  final String? youtube_id;
  final String? url;
  final String? embed_url;
  final Thumbnail? images;

  Trailer({
    this.youtube_id,
    this.url,
    this.embed_url,
    this.images,
  });

  factory Trailer.fromJson(Map<String, dynamic> json) =>
      _$TrailerFromJson(json);

  Map<String, dynamic> toJson() => _$TrailerToJson(this);
}

@JsonSerializable()
class Thumbnail {
  String? image_url;
  String? small_image_url;
  String? large_image_url;
  String? maximum_image_url;

  Thumbnail({
    required this.image_url,
    required this.small_image_url,
    required this.large_image_url,
    required this.maximum_image_url,
  });

  factory Thumbnail.fromJson(Map<String, dynamic> json) =>
      _$ThumbnailFromJson(json);

  Map<String, dynamic> toJson() => _$ThumbnailToJson(this);
}

@JsonSerializable()
class Studios {
  final int? mal_id;
  final String? type;
  final String? name;
  final String? url;

  Studios({
    required this.mal_id,
    required this.type,
    required this.name,
    required this.url,
  });

  factory Studios.fromJson(Map<String, dynamic> json) =>
      _$StudiosFromJson(json);

  Map<String, dynamic> toJson() => _$StudiosToJson(this);
}

@JsonSerializable()
class Aired {
  final String from;
  final String? to;
  final Prop prop;
  final String string;

  Aired({
    required this.from,
    required this.to,
    required this.prop,
    required this.string,
  });

  factory Aired.fromJson(Map<String, dynamic> json) => _$AiredFromJson(json);

  Map<String, dynamic> toJson() => _$AiredToJson(this);
}

@JsonSerializable()
class Prop {
  final From from;
  final To? to;

  Prop({
    required this.from,
    required this.to,
  });

  factory Prop.fromJson(Map<String, dynamic> json) => _$PropFromJson(json);

  Map<String, dynamic> toJson() => _$PropToJson(this);
}

@JsonSerializable()
class From {
  final int day;
  final int month;
  final int year;

  From({required this.day, required this.month, required this.year});

  factory From.fromJson(Map<String, dynamic> json) => _$FromFromJson(json);

  Map<String, dynamic> toJson() => _$FromToJson(this);
}

@JsonSerializable()
class To {
  final int? day;
  final int? month;
  final int? year;

  To({required this.day, required this.month, required this.year});

  factory To.fromJson(Map<String, dynamic> json) => _$ToFromJson(json);

  Map<String, dynamic> toJson() => _$ToToJson(this);
}
