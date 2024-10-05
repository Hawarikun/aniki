import 'package:aniki/core/apis/detail.dart';
import 'package:aniki/core/domain/anime.dart';
import 'package:aniki/core/helpers/api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnimeDetailRepository {
  AnimeDetailRepository(this.api);

  final DetailApi api;

  Future<Anime> detail({required String animeId}) async {
    return await ApiHelper().getData(
      uri: api.detail(animeId: animeId),
      builder: (data) {
        return Anime.fromJson(data["data"]);
      },
    );
  }
}

final animeDetailRepoProv = Provider((ref) {
  final api = DetailApi();
  return AnimeDetailRepository(
    api,
  );
});
