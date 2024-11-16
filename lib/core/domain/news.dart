import 'package:json_annotation/json_annotation.dart';

part 'annatation/news.g.dart';

@JsonSerializable(explicitToJson: true)
class News {
  int? malId;
  String? url;
  String? title;
  DateTime? date;
  String? authorUsername;
  String? authorUrl;
  String? forumUrl;
  Images images;
  int? comments;
  String? excerpt;

  News({
    this.malId,
    this.url,
    this.title,
    this.date,
    this.authorUsername,
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
  String? imageUrl;

  Jpg({
    this.imageUrl,
  });

  factory Jpg.fromJson(Map<String, dynamic> json) => _$JpgFromJson(json);

  Map<String, dynamic> toJson() => _$JpgToJson(this);
}
