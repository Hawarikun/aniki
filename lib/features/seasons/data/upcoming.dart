import 'package:aniki/core/apis/seasons.dart';
import 'package:aniki/core/domain/anime.dart';
import 'package:aniki/core/helpers/api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpcomingRepository {
  UpcomingRepository(this.api);

  final SeasonApi api;

  Future<List<Anime>> index({
    int? page,
    int? limit,
    bool? continuing,
    String? type,
  }) async {
    return await ApiHelper().getData(
      uri: api.upcoming(
        page: page,
        limit: limit,
        continuing: continuing,
        type: type,
      ),
      builder: (data) {
        return List.generate(data["data"].length, (index) {
          return Anime.fromJson(data['data'][index]);
        });
      },
    );
  }
}

final upcomingRepoProv = Provider((ref) {
  final api = SeasonApi();
  return UpcomingRepository(api);
});
