// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'review.g.dart';

@JsonSerializable(explicitToJson: true)
class Review {
  int? mal_id;
  String? url;
  String? type;
  Reactions? reactions;
  DateTime? date;
  String? review;
  int? score;
  List<String>? tags;
  bool? is_spoiler;
  bool? is_preliminary;
  dynamic episodes_watched;
  User? user;

  Review({
    this.mal_id,
    this.url,
    this.type,
    this.reactions,
    this.date,
    this.review,
    this.score,
    this.tags,
    this.is_spoiler,
    this.is_preliminary,
    this.episodes_watched,
    this.user,
  });

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}


@JsonSerializable()
class Reactions {
  int? overall;
  int? nice;
  int? love_it;
  int? funny;
  int? confusing;
  int? informative;
  int? well_written;
  int? creative;

  Reactions({
    this.overall,
    this.nice,
    this.love_it,
    this.funny,
    this.confusing,
    this.informative,
    this.well_written,
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
  String? image_url;

  Image({
    this.image_url,
  });

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);
}
