// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) => News(
      mal_id: (json['mal_id'] as num?)?.toInt(),
      url: json['url'] as String?,
      title: json['title'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      author_username: json['author_username'] as String?,
      authorUrl: json['authorUrl'] as String?,
      forumUrl: json['forumUrl'] as String?,
      images: Images.fromJson(json['images'] as Map<String, dynamic>),
      comments: (json['comments'] as num?)?.toInt(),
      excerpt: json['excerpt'] as String?,
    );

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'mal_id': instance.mal_id,
      'url': instance.url,
      'title': instance.title,
      'date': instance.date?.toIso8601String(),
      'author_username': instance.author_username,
      'authorUrl': instance.authorUrl,
      'forumUrl': instance.forumUrl,
      'images': instance.images.toJson(),
      'comments': instance.comments,
      'excerpt': instance.excerpt,
    };

Images _$ImagesFromJson(Map<String, dynamic> json) => Images(
      jpg: json['jpg'] == null
          ? null
          : Jpg.fromJson(json['jpg'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ImagesToJson(Images instance) => <String, dynamic>{
      'jpg': instance.jpg,
    };

Jpg _$JpgFromJson(Map<String, dynamic> json) => Jpg(
      image_url: json['image_url'] as String?,
    );

Map<String, dynamic> _$JpgToJson(Jpg instance) => <String, dynamic>{
      'image_url': instance.image_url,
    };
