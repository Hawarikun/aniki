// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Review _$ReviewFromJson(Map<String, dynamic> json) => Review(
      mal_id: (json['mal_id'] as num?)?.toInt(),
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
      is_spoiler: json['is_spoiler'] as bool?,
      is_preliminary: json['is_preliminary'] as bool?,
      episodes_watched: json['episodes_watched'],
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      'mal_id': instance.mal_id,
      'url': instance.url,
      'type': instance.type,
      'reactions': instance.reactions?.toJson(),
      'date': instance.date?.toIso8601String(),
      'review': instance.review,
      'score': instance.score,
      'tags': instance.tags,
      'is_spoiler': instance.is_spoiler,
      'is_preliminary': instance.is_preliminary,
      'episodes_watched': instance.episodes_watched,
      'user': instance.user?.toJson(),
    };

Reactions _$ReactionsFromJson(Map<String, dynamic> json) => Reactions(
      overall: (json['overall'] as num?)?.toInt(),
      nice: (json['nice'] as num?)?.toInt(),
      love_it: (json['love_it'] as num?)?.toInt(),
      funny: (json['funny'] as num?)?.toInt(),
      confusing: (json['confusing'] as num?)?.toInt(),
      informative: (json['informative'] as num?)?.toInt(),
      well_written: (json['well_written'] as num?)?.toInt(),
      creative: (json['creative'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ReactionsToJson(Reactions instance) => <String, dynamic>{
      'overall': instance.overall,
      'nice': instance.nice,
      'love_it': instance.love_it,
      'funny': instance.funny,
      'confusing': instance.confusing,
      'informative': instance.informative,
      'well_written': instance.well_written,
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
      image_url: json['image_url'] as String?,
    );

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
      'image_url': instance.image_url,
    };
