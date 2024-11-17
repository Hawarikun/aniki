// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bookmark _$BookmarkFromJson(Map<String, dynamic> json) => Bookmark(
      mal_id: (json['mal_id'] as num).toInt(),
      title: json['title'] as String,
      score: (json['score'] as num?)?.toDouble(),
      image: json['image'] as String?,
    );

Map<String, dynamic> _$BookmarkToJson(Bookmark instance) => <String, dynamic>{
      'mal_id': instance.mal_id,
      'title': instance.title,
      'score': instance.score,
      'image': instance.image,
    };
