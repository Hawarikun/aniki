// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeCast _$AnimeCastFromJson(Map<String, dynamic> json) => AnimeCast(
      character: Character.fromJson(json['character'] as Map<String, dynamic>),
      role: json['role'] as String,
      favorites: (json['favorites'] as num).toInt(),
      voice_actors: (json['voice_actors'] as List<dynamic>)
          .map((e) => VoiceActor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AnimeCastToJson(AnimeCast instance) => <String, dynamic>{
      'character': instance.character.toJson(),
      'role': instance.role,
      'favorites': instance.favorites,
      'voice_actors': instance.voice_actors.map((e) => e.toJson()).toList(),
    };

Character _$CharacterFromJson(Map<String, dynamic> json) => Character(
      mal_id: (json['mal_id'] as num).toInt(),
      url: json['url'] as String,
      images: CharacterImages.fromJson(json['images'] as Map<String, dynamic>),
      name: json['name'] as String,
    );

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
      'mal_id': instance.mal_id,
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
      image_url: json['image_url'] as String?,
    );

Map<String, dynamic> _$JpgToJson(Jpg instance) => <String, dynamic>{
      'image_url': instance.image_url,
    };

Webp _$WebpFromJson(Map<String, dynamic> json) => Webp(
      image_url: json['image_url'] as String?,
      smallImageUrl: json['smallImageUrl'] as String?,
    );

Map<String, dynamic> _$WebpToJson(Webp instance) => <String, dynamic>{
      'image_url': instance.image_url,
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
      mal_id: (json['mal_id'] as num).toInt(),
      url: json['url'] as String,
      images: PersonImages.fromJson(json['images'] as Map<String, dynamic>),
      name: json['name'] as String,
    );

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'mal_id': instance.mal_id,
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
