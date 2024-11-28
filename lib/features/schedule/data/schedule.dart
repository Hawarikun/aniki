import 'package:aniki/core/apis/seasons.dart';
import 'package:aniki/core/domain/anime.dart';
import 'package:aniki/core/helpers/api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScheduleAnimeRepository {
  ScheduleAnimeRepository(this.api);

  final SeasonApi api;

  Future<List<Anime>> index(int page, int limit) async {
    return await ApiHelper().getData(
      uri: api.ongoing(page: page, limit: limit),
      builder: (data) {
        return List.generate(
          data["data"].length,
          (index) => Anime.fromJson(data["data"][index]),
        );
      },
    );
  }
}

final scheduleAnimeRepoProv = Provider(
  (ref) {
    final api = SeasonApi();
    return ScheduleAnimeRepository(api);
  },
);
