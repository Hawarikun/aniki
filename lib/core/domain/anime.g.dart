// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Anime _$AnimeFromJson(Map<String, dynamic> json) => Anime(
      mal_id: (json['mal_id'] as num).toInt(),
      url: json['url'] as String?,
      images: Images.fromJson(json['images'] as Map<String, dynamic>),
      trailer: Trailer.fromJson(json['trailer'] as Map<String, dynamic>),
      title: json['title'] as String,
      title_english: json['title_english'] as String?,
      title_japanese: json['title_japanese'] as String?,
      type: json['type'] as String,
      source: json['source'] as String?,
      episodes: (json['episodes'] as num?)?.toInt(),
      status: json['status'] as String?,
      duration: json['duration'] as String?,
      rating: json['rating'] as String?,
      score: (json['score'] as num?)?.toDouble(),
      synopsis: json['synopsis'] as String?,
      background: json['background'] as String?,
      season: json['season'] as String?,
      year: (json['year'] as num?)?.toInt(),
      studios: (json['studios'] as List<dynamic>?)
          ?.map((e) => Studios.fromJson(e as Map<String, dynamic>))
          .toList(),
      genres: (json['genres'] as List<dynamic>)
          .map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
      aired: Aired.fromJson(json['aired'] as Map<String, dynamic>),
      broadcast: Broadcast.fromJson(json['broadcast'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnimeToJson(Anime instance) => <String, dynamic>{
      'mal_id': instance.mal_id,
      'url': instance.url,
      'images': instance.images.toJson(),
      'trailer': instance.trailer.toJson(),
      'title': instance.title,
      'title_english': instance.title_english,
      'title_japanese': instance.title_japanese,
      'type': instance.type,
      'source': instance.source,
      'episodes': instance.episodes,
      'status': instance.status,
      'duration': instance.duration,
      'rating': instance.rating,
      'score': instance.score,
      'synopsis': instance.synopsis,
      'background': instance.background,
      'season': instance.season,
      'year': instance.year,
      'studios': instance.studios?.map((e) => e.toJson()).toList(),
      'genres': instance.genres.map((e) => e.toJson()).toList(),
      'aired': instance.aired.toJson(),
      'broadcast': instance.broadcast.toJson(),
    };

Images _$ImagesFromJson(Map<String, dynamic> json) => Images(
      jpg: json['jpg'] == null
          ? null
          : Jpg.fromJson(json['jpg'] as Map<String, dynamic>),
      webp: json['webp'] == null
          ? null
          : Webp.fromJson(json['webp'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ImagesToJson(Images instance) => <String, dynamic>{
      'jpg': instance.jpg,
      'webp': instance.webp,
    };

Jpg _$JpgFromJson(Map<String, dynamic> json) => Jpg(
      image_url: json['image_url'] as String?,
      small_image_url: json['small_image_url'] as String?,
      large_image_url: json['large_image_url'] as String?,
    );

Map<String, dynamic> _$JpgToJson(Jpg instance) => <String, dynamic>{
      'image_url': instance.image_url,
      'small_image_url': instance.small_image_url,
      'large_image_url': instance.large_image_url,
    };

Webp _$WebpFromJson(Map<String, dynamic> json) => Webp(
      image_url: json['image_url'] as String?,
      small_image_url: json['small_image_url'] as String?,
      large_image_url: json['large_image_url'] as String?,
    );

Map<String, dynamic> _$WebpToJson(Webp instance) => <String, dynamic>{
      'image_url': instance.image_url,
      'small_image_url': instance.small_image_url,
      'large_image_url': instance.large_image_url,
    };

Genre _$GenreFromJson(Map<String, dynamic> json) => Genre(
      mal_id: (json['mal_id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$GenreToJson(Genre instance) => <String, dynamic>{
      'mal_id': instance.mal_id,
      'name': instance.name,
    };

Trailer _$TrailerFromJson(Map<String, dynamic> json) => Trailer(
      youtube_id: json['youtube_id'] as String?,
      url: json['url'] as String?,
      embed_url: json['embed_url'] as String?,
      images: json['images'] == null
          ? null
          : Thumbnail.fromJson(json['images'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TrailerToJson(Trailer instance) => <String, dynamic>{
      'youtube_id': instance.youtube_id,
      'url': instance.url,
      'embed_url': instance.embed_url,
      'images': instance.images,
    };

Thumbnail _$ThumbnailFromJson(Map<String, dynamic> json) => Thumbnail(
      image_url: json['image_url'] as String?,
      small_image_url: json['small_image_url'] as String?,
      large_image_url: json['large_image_url'] as String?,
      maximum_image_url: json['maximum_image_url'] as String?,
    );

Map<String, dynamic> _$ThumbnailToJson(Thumbnail instance) => <String, dynamic>{
      'image_url': instance.image_url,
      'small_image_url': instance.small_image_url,
      'large_image_url': instance.large_image_url,
      'maximum_image_url': instance.maximum_image_url,
    };

Studios _$StudiosFromJson(Map<String, dynamic> json) => Studios(
      mal_id: (json['mal_id'] as num?)?.toInt(),
      type: json['type'] as String?,
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$StudiosToJson(Studios instance) => <String, dynamic>{
      'mal_id': instance.mal_id,
      'type': instance.type,
      'name': instance.name,
      'url': instance.url,
    };

Aired _$AiredFromJson(Map<String, dynamic> json) => Aired(
      from: json['from'] as String?,
      to: json['to'] as String?,
      prop: Prop.fromJson(json['prop'] as Map<String, dynamic>),
      string: json['string'] as String?,
    );

Map<String, dynamic> _$AiredToJson(Aired instance) => <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
      'prop': instance.prop,
      'string': instance.string,
    };

Prop _$PropFromJson(Map<String, dynamic> json) => Prop(
      from: From.fromJson(json['from'] as Map<String, dynamic>),
      to: To.fromJson(json['to'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PropToJson(Prop instance) => <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
    };

From _$FromFromJson(Map<String, dynamic> json) => From(
      day: (json['day'] as num?)?.toInt(),
      month: (json['month'] as num?)?.toInt(),
      year: (json['year'] as num?)?.toInt(),
    );

Map<String, dynamic> _$FromToJson(From instance) => <String, dynamic>{
      'day': instance.day,
      'month': instance.month,
      'year': instance.year,
    };

To _$ToFromJson(Map<String, dynamic> json) => To(
      day: (json['day'] as num?)?.toInt(),
      month: (json['month'] as num?)?.toInt(),
      year: (json['year'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ToToJson(To instance) => <String, dynamic>{
      'day': instance.day,
      'month': instance.month,
      'year': instance.year,
    };

Broadcast _$BroadcastFromJson(Map<String, dynamic> json) => Broadcast(
      day: json['day'] as String?,
      time: json['time'] as String?,
      timezone: json['timezone'] as String?,
      string: json['string'] as String?,
    );

Map<String, dynamic> _$BroadcastToJson(Broadcast instance) => <String, dynamic>{
      'day': instance.day,
      'time': instance.time,
      'timezone': instance.timezone,
      'string': instance.string,
    };
