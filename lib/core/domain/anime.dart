// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'anime.g.dart';

@JsonSerializable(explicitToJson: true)
class Anime {
  int mal_id;
  String? url;
  Images images;
  Trailer trailer;
  String title;
  String? title_english;
  String? title_japanese;
  String? type;
  String? source;
  int? episodes;
  String? status;
  String? duration;
  String? rating;
  double? score;
  String? synopsis;
  String? background;
  String? season;
  int? year;
  List<Studios>? studios;
  List<Genre> genres;
  Aired aired;
  Broadcast broadcast;
  List<Producer> producers;
  List<Licensor> licensors;
  List<String>? title_synonyms;
  ThemeSongs? theme;

  Anime({
    required this.mal_id,
    this.url,
    required this.images,
    required this.trailer,
    required this.title,
    this.title_english,
    this.title_japanese,
    this.type,
    this.source,
    this.episodes,
    this.status,
    this.duration,
    this.rating,
    this.score,
    this.synopsis,
    this.background,
    this.season,
    this.year,
    this.studios,
    required this.genres,
    required this.aired,
    required this.broadcast,
    required this.producers,
    required this.licensors,
    this.title_synonyms,
    this.theme,
  });

  factory Anime.fromJson(Map<String, dynamic> json) => _$AnimeFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeToJson(this);
}

@JsonSerializable()
class Images {
  Jpg? jpg;
  Webp? webp;

  Images({
    this.jpg,
    this.webp,
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
    this.image_url,
    this.small_image_url,
    this.large_image_url,
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
    this.image_url,
    this.small_image_url,
    this.large_image_url,
  });

  factory Webp.fromJson(Map<String, dynamic> json) => _$WebpFromJson(json);

  Map<String, dynamic> toJson() => _$WebpToJson(this);
}

@JsonSerializable()
class Genre {
  int? mal_id;
  String? name;

  Genre({
    this.mal_id,
    this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  Map<String, dynamic> toJson() => _$GenreToJson(this);
}

@JsonSerializable()
class Trailer {
  String? youtube_id;
  String? url;
  String? embed_url;
  Thumbnail? images;

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
    this.image_url,
    this.small_image_url,
    this.large_image_url,
    this.maximum_image_url,
  });

  factory Thumbnail.fromJson(Map<String, dynamic> json) =>
      _$ThumbnailFromJson(json);

  Map<String, dynamic> toJson() => _$ThumbnailToJson(this);
}

@JsonSerializable()
class Studios {
  int? mal_id;
  String? type;
  String? name;
  String? url;

  Studios({
    this.mal_id,
    this.type,
    this.name,
    this.url,
  });

  factory Studios.fromJson(Map<String, dynamic> json) =>
      _$StudiosFromJson(json);

  Map<String, dynamic> toJson() => _$StudiosToJson(this);
}

@JsonSerializable()
class Aired {
  String? from;
  String? to;
  Prop prop;
  String? string;

  Aired({
    this.from,
    this.to,
    required this.prop,
    this.string,
  });

  factory Aired.fromJson(Map<String, dynamic> json) => _$AiredFromJson(json);

  Map<String, dynamic> toJson() => _$AiredToJson(this);
}

@JsonSerializable()
class Prop {
  From from;
  To to;

  Prop({
    required this.from,
    required this.to,
  });

  factory Prop.fromJson(Map<String, dynamic> json) => _$PropFromJson(json);

  Map<String, dynamic> toJson() => _$PropToJson(this);
}

@JsonSerializable()
class From {
  int? day;
  int? month;
  int? year;

  From({this.day, this.month, this.year});

  factory From.fromJson(Map<String, dynamic> json) => _$FromFromJson(json);

  Map<String, dynamic> toJson() => _$FromToJson(this);
}

@JsonSerializable()
class To {
  int? day;
  int? month;
  int? year;

  To({this.day, this.month, this.year});

  factory To.fromJson(Map<String, dynamic> json) => _$ToFromJson(json);

  Map<String, dynamic> toJson() => _$ToToJson(this);
}

@JsonSerializable()
class Broadcast {
  String? day;
  String? time;
  String? timezone;
  String? string;

  Broadcast({
    this.day,
    this.time,
    this.timezone,
    this.string,
  });

  factory Broadcast.fromJson(Map<String, dynamic> json) =>
      _$BroadcastFromJson(json);

  Map<String, dynamic> toJson() => _$BroadcastToJson(this);
}

@JsonSerializable()
class Producer {
  int? malId;
  String? type;
  String? name;
  String? url;

  Producer({
    this.malId,
    this.type,
    this.name,
    this.url,
  });

  factory Producer.fromJson(Map<String, dynamic> json) =>
      _$ProducerFromJson(json);

  Map<String, dynamic> toJson() => _$ProducerToJson(this);
}

@JsonSerializable()
class Licensor {
  int? malId;
  String? type;
  String? name;
  String? url;

  Licensor({
    this.malId,
    this.type,
    this.name,
    this.url,
  });

  factory Licensor.fromJson(Map<String, dynamic> json) =>
      _$LicensorFromJson(json);

  Map<String, dynamic> toJson() => _$LicensorToJson(this);
}

@JsonSerializable()
class ThemeSongs {
  List<String>? openings;
  List<String>? endings;

  ThemeSongs({
    this.openings,
    this.endings,
  });

  factory ThemeSongs.fromJson(Map<String, dynamic> json) =>
      _$ThemeSongsFromJson(json);

  Map<String, dynamic> toJson() => _$ThemeSongsToJson(this);
}
