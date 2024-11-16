import 'package:json_annotation/json_annotation.dart';

part 'annatation/review.g.dart';

@JsonSerializable(explicitToJson: true)
class Review {
  int? malId;
  String? url;
  String? type;
  Reactions? reactions;
  DateTime? date;
  String? review;
  int? score;
  List<String>? tags;
  bool? isSpoiler;
  bool? isPreliminary;
  dynamic episodesWatched;
  User? user;

  Review({
    this.malId,
    this.url,
    this.type,
    this.reactions,
    this.date,
    this.review,
    this.score,
    this.tags,
    this.isSpoiler,
    this.isPreliminary,
    this.episodesWatched,
    this.user,
  });

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}


@JsonSerializable()
class Reactions {
  int? overall;
  int? nice;
  int? loveIt;
  int? funny;
  int? confusing;
  int? informative;
  int? wellWritten;
  int? creative;

  Reactions({
    this.overall,
    this.nice,
    this.loveIt,
    this.funny,
    this.confusing,
    this.informative,
    this.wellWritten,
    this.creative,
  });

  factory Reactions.fromJson(Map<String, dynamic> json) => _$ReactionsFromJson(json);

  Map<String, dynamic> toJson() => _$ReactionsToJson(this);
}

@JsonSerializable()
class User {
  String? url;
  String? username;
  Map<String, Image>? images;

  User({
    this.url,
    this.username,
    this.images,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Image {
  String? imageUrl;

  Image({
    this.imageUrl,
  });

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);
}
