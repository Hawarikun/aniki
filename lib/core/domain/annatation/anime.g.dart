// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../anime.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Anime _$AnimeFromJson(Map<String, dynamic> json) => Anime(
      id: (json['id'] as num).toInt(),
      url: json['url'] as String,
      images: json['images'] as String,
      trailer: json['trailer'] == null
          ? null
          : Trailer.fromJson(json['trailer'] as Map<String, dynamic>),
      title: json['title'] as String,
      type: json['type'] as String,
      source: json['source'] as String,
      episodes: (json['episodes'] as num?)?.toInt(),
      status: json['status'] as String,
      duration: json['duration'] as String?,
      rating: json['rating'] as String?,
      score: (json['score'] as num?)?.toDouble(),
      synopsis: json['synopsis'] as String?,
      background: json['background'] as String,
      season: json['season'] as String?,
      year: (json['year'] as num?)?.toInt(),
      studios: (json['studios'] as List<dynamic>)
          .map((e) => Studios.fromJson(e as Map<String, dynamic>))
          .toList(),
      genres: (json['genres'] as List<dynamic>)
          .map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
      aried: json['aried'] as String?,
    )
      ..titleEnglish = json['titleEnglish'] as String?
      ..titleJapanese = json['titleJapanese'] as String?;

Map<String, dynamic> _$AnimeToJson(Anime instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'images': instance.images,
      'trailer': instance.trailer?.toJson(),
      'title': instance.title,
      'titleEnglish': instance.titleEnglish,
      'titleJapanese': instance.titleJapanese,
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
      'studios': instance.studios.map((e) => e.toJson()).toList(),
      'genres': instance.genres.map((e) => e.toJson()).toList(),
      'aried': instance.aried,
    };

Genre _$GenreFromJson(Map<String, dynamic> json) => Genre(
      malId: (json['malId'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$GenreToJson(Genre instance) => <String, dynamic>{
      'malId': instance.malId,
      'name': instance.name,
    };

Trailer _$TrailerFromJson(Map<String, dynamic> json) => Trailer(
      youtubeId: json['youtubeId'] as String?,
      url: json['url'] as String?,
      embedUrl: json['embedUrl'] as String?,
      images: json['images'] as String?,
    );

Map<String, dynamic> _$TrailerToJson(Trailer instance) => <String, dynamic>{
      'youtubeId': instance.youtubeId,
      'url': instance.url,
      'embedUrl': instance.embedUrl,
      'images': instance.images,
    };

Studios _$StudiosFromJson(Map<String, dynamic> json) => Studios(
      malId: (json['malId'] as num).toInt(),
      type: json['type'] as String,
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$StudiosToJson(Studios instance) => <String, dynamic>{
      'malId': instance.malId,
      'type': instance.type,
      'name': instance.name,
      'url': instance.url,
    };
