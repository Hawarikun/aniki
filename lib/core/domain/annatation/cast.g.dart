// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../cast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeCast _$AnimeCastFromJson(Map<String, dynamic> json) => AnimeCast(
      character: Character.fromJson(json['character'] as Map<String, dynamic>),
      role: json['role'] as String,
      favorites: (json['favorites'] as num).toInt(),
      voiceActors: (json['voiceActors'] as List<dynamic>)
          .map((e) => VoiceActor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AnimeCastToJson(AnimeCast instance) => <String, dynamic>{
      'character': instance.character.toJson(),
      'role': instance.role,
      'favorites': instance.favorites,
      'voiceActors': instance.voiceActors.map((e) => e.toJson()).toList(),
    };

Character _$CharacterFromJson(Map<String, dynamic> json) => Character(
      malId: (json['malId'] as num).toInt(),
      url: json['url'] as String,
      images: CharacterImages.fromJson(json['images'] as Map<String, dynamic>),
      name: json['name'] as String,
    );

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
      'malId': instance.malId,
      'url': instance.url,
      'images': instance.images,
      'name': instance.name,
    };

CharacterImages _$CharacterImagesFromJson(Map<String, dynamic> json) =>
    CharacterImages(
      jpg: Jpg.fromJson(json['jpg'] as Map<String, dynamic>),
      webp: Webp.fromJson(json['webp'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CharacterImagesToJson(CharacterImages instance) =>
    <String, dynamic>{
      'jpg': instance.jpg,
      'webp': instance.webp,
    };

Jpg _$JpgFromJson(Map<String, dynamic> json) => Jpg(
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$JpgToJson(Jpg instance) => <String, dynamic>{
      'imageUrl': instance.imageUrl,
    };

Webp _$WebpFromJson(Map<String, dynamic> json) => Webp(
      imageUrl: json['imageUrl'] as String,
      smallImageUrl: json['smallImageUrl'] as String,
    );

Map<String, dynamic> _$WebpToJson(Webp instance) => <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'smallImageUrl': instance.smallImageUrl,
    };

VoiceActor _$VoiceActorFromJson(Map<String, dynamic> json) => VoiceActor(
      person: Person.fromJson(json['person'] as Map<String, dynamic>),
      language: json['language'] as String,
    );

Map<String, dynamic> _$VoiceActorToJson(VoiceActor instance) =>
    <String, dynamic>{
      'person': instance.person,
      'language': instance.language,
    };

Person _$PersonFromJson(Map<String, dynamic> json) => Person(
      malId: (json['malId'] as num).toInt(),
      url: json['url'] as String,
      images: PersonImages.fromJson(json['images'] as Map<String, dynamic>),
      name: json['name'] as String,
    );

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'malId': instance.malId,
      'url': instance.url,
      'images': instance.images,
      'name': instance.name,
    };

PersonImages _$PersonImagesFromJson(Map<String, dynamic> json) => PersonImages(
      jpg: Jpg.fromJson(json['jpg'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PersonImagesToJson(PersonImages instance) =>
    <String, dynamic>{
      'jpg': instance.jpg,
    };
