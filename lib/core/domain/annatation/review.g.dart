// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Review _$ReviewFromJson(Map<String, dynamic> json) => Review(
      malId: (json['malId'] as num?)?.toInt(),
      url: json['url'] as String?,
      type: json['type'] as String?,
      reactions: json['reactions'] == null
          ? null
          : Reactions.fromJson(json['reactions'] as Map<String, dynamic>),
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      review: json['review'] as String?,
      score: (json['score'] as num?)?.toInt(),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      isSpoiler: json['isSpoiler'] as bool?,
      isPreliminary: json['isPreliminary'] as bool?,
      episodesWatched: json['episodesWatched'],
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      'malId': instance.malId,
      'url': instance.url,
      'type': instance.type,
      'reactions': instance.reactions?.toJson(),
      'date': instance.date?.toIso8601String(),
      'review': instance.review,
      'score': instance.score,
      'tags': instance.tags,
      'isSpoiler': instance.isSpoiler,
      'isPreliminary': instance.isPreliminary,
      'episodesWatched': instance.episodesWatched,
      'user': instance.user?.toJson(),
    };

Reactions _$ReactionsFromJson(Map<String, dynamic> json) => Reactions(
      overall: (json['overall'] as num?)?.toInt(),
      nice: (json['nice'] as num?)?.toInt(),
      loveIt: (json['loveIt'] as num?)?.toInt(),
      funny: (json['funny'] as num?)?.toInt(),
      confusing: (json['confusing'] as num?)?.toInt(),
      informative: (json['informative'] as num?)?.toInt(),
      wellWritten: (json['wellWritten'] as num?)?.toInt(),
      creative: (json['creative'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ReactionsToJson(Reactions instance) => <String, dynamic>{
      'overall': instance.overall,
      'nice': instance.nice,
      'loveIt': instance.loveIt,
      'funny': instance.funny,
      'confusing': instance.confusing,
      'informative': instance.informative,
      'wellWritten': instance.wellWritten,
      'creative': instance.creative,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      url: json['url'] as String?,
      username: json['username'] as String?,
      images: (json['images'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, Image.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'url': instance.url,
      'username': instance.username,
      'images': instance.images,
    };

Image _$ImageFromJson(Map<String, dynamic> json) => Image(
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
      'imageUrl': instance.imageUrl,
    };
