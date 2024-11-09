import 'package:aniki/core/apis/character.dart';
import 'package:aniki/core/domain/character.dart';
import 'package:aniki/core/helpers/api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnimeCharacterRevository {
  AnimeCharacterRevository(this.api);

  final CharacterApi api;

  Future<List<AnimeChar>> index({required String id}) async {
    return await ApiHelper().getData(
      uri: api.index(id: id),
      builder: (data) {
        return List.generate(data["data"].length, (index) {
          return AnimeChar.fromJson(data['data'][index]);
        });
      },
    );
  }
}

final animeCharRepoProv = Provider((ref) {
  final api = CharacterApi();
  return AnimeCharacterRevository(
    api,
  );
});