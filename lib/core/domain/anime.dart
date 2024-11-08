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
  // String duration;
  String? rating;
  double? score;
  String? synopsis;
  String background;
  String? season;
  int? year;
  List<Studios> studios;
  List<Genre> genres;

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
    // required this.duration,
    this.rating,
    this.score,
    this.synopsis,
    required this.background,
    this.season,
    this.year,
    required this.studios,
    required this.genres,
  });
  factory Anime.fromJson(Map<String, dynamic> map) => Anime(
        id: map["mal_id"],
        url: map["url"],
        images: map["images"]["jpg"]["large_image_url"],
        trailer: Trailer.fromJson(map["trailer"]),
        title: map["title"],
        // titleEnglish: map["title_english"] ?? "N/A",
        // titleJapanese: map["title_japanese"] ?? "N/A",
        type: map["type"],
        source: map["source"],
        episodes: map["episodes"] ?? 0,
        status: map["status"],
        // duration: map["duration"],
        rating: map["rating"] ?? "N/A",
        score: map['score'] is int
            ? (map['score'] as int).toDouble()
            : map['score'] as double?,
        synopsis: map["synopsis"] ?? "N/A",
        background: map["background"],
        season: map["season"] ?? "N/A",
        year: map["year"] ?? 0,
        studios: List<Studios>.from(
          map["studios"].map(
            (x) => Studios.fromJson(x),
          ),
        ),
        genres: List<Genre>.from(
          map["genres"].map(
            (x) => Genre.fromJson(x),
          ),
        ),
      );
}

class Genre {
  int malId;
  String name;

  Genre({
    required this.malId,
    required this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> map) => Genre(
        malId: map["mal_id"],
        name: map["name"],
      );
}

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

  factory Trailer.fromJson(Map<String, dynamic> map) => Trailer(
        youtubeId: map["youtube_id"] ?? "N/A",
        url: map["url"] ?? "N/A",
        embedUrl: map["embed_url"] ?? "N/A",
        images: map["images"]["image_url"] ?? "N/A",
      );
}

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

  factory Studios.fromJson(Map<String, dynamic> map) => Studios(
        malId: map["mal_id"],
        type: map["type"],
        name: map["name"],
        url: map["url"],
      );
}
