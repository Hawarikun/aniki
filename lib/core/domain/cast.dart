import 'package:json_annotation/json_annotation.dart';

part 'annatation/cast.g.dart';

@JsonSerializable(explicitToJson: true)
class AnimeCast {
  Character character;
  String role;
  int favorites;
  List<VoiceActor> voiceActors;

  AnimeCast({
    required this.character,
    required this.role,
    required this.favorites,
    required this.voiceActors,
  });

  factory AnimeCast.fromJson(Map<String, dynamic> json) => _$AnimeCastFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeCastToJson(this);
}

@JsonSerializable()
class Character {
  int malId;
  String url;
  CharacterImages images;
  String name;

  Character({
    required this.malId,
    required this.url,
    required this.images,
    required this.name,
  });

  factory Character.fromJson(Map<String, dynamic> json) => _$CharacterFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterToJson(this);
}

@JsonSerializable()
class CharacterImages {
  Jpg jpg;
  Webp webp;

  CharacterImages({
    required this.jpg,
    required this.webp,
  });

  factory CharacterImages.fromJson(Map<String, dynamic> json) => _$CharacterImagesFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterImagesToJson(this);
}

@JsonSerializable()
class Jpg {
  String imageUrl;

  Jpg({
    required this.imageUrl,
  });

  factory Jpg.fromJson(Map<String, dynamic> json) => _$JpgFromJson(json);

  Map<String, dynamic> toJson() => _$JpgToJson(this);
}

@JsonSerializable()
class Webp {
  String imageUrl;
  String smallImageUrl;

  Webp({
    required this.imageUrl,
    required this.smallImageUrl,
  });

  factory Webp.fromJson(Map<String, dynamic> json) => _$WebpFromJson(json);

  Map<String, dynamic> toJson() => _$WebpToJson(this);
}

@JsonSerializable()
class VoiceActor {
  Person person;
  String language;

  VoiceActor({
    required this.person,
    required this.language,
  });

  factory VoiceActor.fromJson(Map<String, dynamic> json) => _$VoiceActorFromJson(json);

  Map<String, dynamic> toJson() => _$VoiceActorToJson(this);
}

@JsonSerializable()
class Person {
  int malId;
  String url;
  PersonImages images;
  String name;

  Person({
    required this.malId,
    required this.url,
    required this.images,
    required this.name,
  });

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);
}

@JsonSerializable()
class PersonImages {
  Jpg jpg;

  PersonImages({
    required this.jpg,
  });

  factory PersonImages.fromJson(Map<String, dynamic> json) => _$PersonImagesFromJson(json);

  Map<String, dynamic> toJson() => _$PersonImagesToJson(this);
}
