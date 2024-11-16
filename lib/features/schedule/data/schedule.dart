import 'package:aniki/core/apis/schedule.dart';
import 'package:aniki/core/domain/anime.dart';
import 'package:aniki/core/helpers/api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScheduleAnimeRepository {
  ScheduleAnimeRepository(this.api);

  final ScheduleApi api;

  Future<List<Anime>> index(String day) async {
    return await ApiHelper().getData(
      uri: api.index(day),
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
    final api = ScheduleApi();
    return ScheduleAnimeRepository(api);
  },
);
