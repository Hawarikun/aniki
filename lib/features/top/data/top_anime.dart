import 'package:aniki/core/apis/top_anime.dart';
import 'package:aniki/core/domain/anime.dart';
import 'package:aniki/core/helpers/api.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopAnimeRepository {
  TopAnimeRepository(this.api);

  final TopAnimeApi api;

  Future<List<Anime>> index({int? page, int? limit}) async {
    return await ApiHelper().getData(
      uri: api.index(
        page: page,
        limit: limit,
      ),
      header: ApiHelper.header(),
      builder: (data) {
        return List.generate(data["data"].length, (index) {
          return Anime.fromJson(data['data'][index]);
        });
      },
    );
  }
}

final topAnimeRepoProv = Provider((ref) {
  final api = TopAnimeApi();
  return TopAnimeRepository(
    api,
  );
});
