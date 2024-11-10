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

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        malId: json["mal_id"],
        url: json["url"],
        type: json["type"],
        reactions: json["reactions"] == null
            ? null
            : Reactions.fromJson(json["reactions"]),
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        review: json["review"],
        score: json["score"],
        tags: json["tags"] == null ? null : List<String>.from(json["tags"]),
        isSpoiler: json["is_spoiler"],
        isPreliminary: json["is_preliminary"],
        episodesWatched: json["episodes_watched"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );
}

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

  factory Reactions.fromJson(Map<String, dynamic> json) => Reactions(
        overall: json["overall"],
        nice: json["nice"],
        loveIt: json["love_it"],
        funny: json["funny"],
        confusing: json["confusing"],
        informative: json["informative"],
        wellWritten: json["well_written"],
        creative: json["creative"],
      );
}

class User {
  String? url;
  String? username;
  Map<String, Image>? images;

  User({
    this.url,
    this.username,
    this.images,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        url: json["url"],
        username: json["username"],
        images: json["images"] == null
            ? null
            : Map.from(json["images"])
                .map((k, v) => MapEntry<String, Image>(k, Image.fromJson(v))),
      );
}

class Image {
  String? imageUrl;

  Image({
    this.imageUrl,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        imageUrl: json["image_url"],
      );
}
