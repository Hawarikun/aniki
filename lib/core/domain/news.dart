// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';

@JsonSerializable(explicitToJson: true)
class News {
  int? mal_id;
  String? url;
  String? title;
  DateTime? date;
  String? author_username;
  String? authorUrl;
  String? forumUrl;
  Images images;
  int? comments;
  String? excerpt;

  News({
    this.mal_id,
    this.url,
    this.title,
    this.date,
    this.author_username,
    this.authorUrl,
    this.forumUrl,
    required this.images,
    this.comments,
    this.excerpt,
  });

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  Map<String, dynamic> toJson() => _$NewsToJson(this);
}

@JsonSerializable()
class Images {
  Jpg? jpg;

  Images({
    this.jpg,
  });

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesToJson(this);
}

@JsonSerializable()
class Jpg {
  String? image_url;

  Jpg({
    this.image_url,
  });

  factory Jpg.fromJson(Map<String, dynamic> json) => _$JpgFromJson(json);

  Map<String, dynamic> toJson() => _$JpgToJson(this);
}
