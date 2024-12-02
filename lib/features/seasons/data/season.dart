import 'package:aniki/core/apis/seasons.dart';
import 'package:aniki/core/domain/anime.dart';
import 'package:aniki/core/helpers/api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SeasonRepository {
  SeasonRepository({required this.api});

  SeasonApi api;

  Future<List<Anime>> getAnimeSeasons({
    required int year,
    required String seasons,
    int? page,
    int? limit,
    bool? continuing,
    String? type,
  }) async {
    return ApiHelper().getData(
      uri: api.getSeasonAnime(
          year: year,
          seasons: seasons,
          page: page,
          limit: limit,
          continuing: continuing,
          type: type),
      builder: (data) => List.generate(
        data["data"].length,
        (index) => Anime.fromJson(data['data'][index]),
      ),
    );
  }
}

final seasonsRepoProv = Provider(
  (ref) {
    final api = SeasonApi();
    return SeasonRepository(api: api);
  },
);
