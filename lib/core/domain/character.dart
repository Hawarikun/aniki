class AnimeChar {
  Character character;
  String role;
  int favorites;
  List<VoiceActor> voiceActors;

  AnimeChar({
    required this.character,
    required this.role,
    required this.favorites,
    required this.voiceActors,
  });

  factory AnimeChar.fromJson(Map<String, dynamic> json) {
    return AnimeChar(
      character: Character.fromJson(json["character"]),
      role: json["role"],
      favorites: json["favorites"],
      voiceActors: List.generate(
        json["voice_actors"].length,
        (index) => VoiceActor.fromJson(json["voice_actors"][index]),
      ),
    );
  }
}

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

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      malId: json["mal_id"],
      url: json["url"],
      images: CharacterImages(
        jpg: Jpg(imageUrl: json["images"]["jpg"]["image_url"]),
        webp: Webp(
          imageUrl: json["images"]["webp"]["image_url"],
          smallImageUrl: json["images"]["webp"]["small_image_url"],
        ),
      ),
      name: json["name"],
    );
  }
}

class CharacterImages {
  Jpg jpg;
  Webp webp;

  CharacterImages({
    required this.jpg,
    required this.webp,
  });

  factory CharacterImages.fromJson(Map<String, dynamic> json) {
    return CharacterImages(
      jpg: Jpg(imageUrl: json["jpg"]["image_url"]),
      webp: Webp(
        imageUrl: json["webp"]["image_url"],
        smallImageUrl: json["webp"]["small_image_url"],
      ),
    );
  }
}

class Jpg {
  String imageUrl;

  Jpg({
    required this.imageUrl,
  });

  factory Jpg.fromJson(Map<String, dynamic> json) {
    return Jpg(imageUrl: json["image_url"]);
  }
}

class Webp {
  String imageUrl;
  String smallImageUrl;

  Webp({
    required this.imageUrl,
    required this.smallImageUrl,
  });

  factory Webp.fromJson(Map<String, dynamic> json) {
    return Webp(
      imageUrl: json["image_url"],
      smallImageUrl: json["small_image_url"],
    );
  }
}

class VoiceActor {
  Person person;
  String language;

  VoiceActor({
    required this.person,
    required this.language,
  });

  factory VoiceActor.fromJson(Map<String, dynamic> json) {
    return VoiceActor(
      person: Person.fromJson(json["person"]),
      language: json["language"],
    );
  }
}

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

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      malId: json["mal_id"],
      url: json["url"],
      images: PersonImages(
        jpg: Jpg(imageUrl: json["images"]["jpg"]["image_url"]),
      ),
      name: json["name"],
    );
  }
}

class PersonImages {
  Jpg jpg;

  PersonImages({
    required this.jpg,
  });

  factory PersonImages.fromJson(Map<String, dynamic> json) {
    return PersonImages(
      jpg: Jpg(imageUrl: json["jpg"]["image_url"]),
    );
  }
}
