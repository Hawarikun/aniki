class News {
  int? malId;
  String? url;
  String? title;
  DateTime? date;
  String? authorUsername;
  String? authorUrl;
  String? forumUrl;
  Images? images;
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
    this.images,
    this.comments,
    this.excerpt,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      malId: json['mal_id'],
      url: json['url'],
      title: json['title'],
      date: DateTime.parse(json['date']),
      authorUsername: json['author_username'],
      authorUrl: json['author_url'],
      forumUrl: json['forum_url'],
      images: json['images'] != null ? Images.fromJson(json['images']) : null,
      comments: json['comments'],
      excerpt: json['excerpt'],
    );
  }
}

class Images {
  Jpg? jpg;

  Images({
    this.jpg,
  });

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      jpg: json['jpg'] != null ? Jpg.fromJson(json['jpg']) : null,
    );
  }
}

class Jpg {
  String? imageUrl;

  Jpg({
    this.imageUrl,
  });

  factory Jpg.fromJson(Map<String, dynamic> json) {
    return Jpg(
      imageUrl: json['image_url'],
    );
  }
}
