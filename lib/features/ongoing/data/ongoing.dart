import 'package:aniki/core/apis/seasons.dart';
import 'package:aniki/core/domain/anime.dart';
import 'package:aniki/core/helpers/api.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class OngoingRepository {
  OngoingRepository(this.api);

  final SeasonApi api;

  Future<List<Anime>> index({
    int? page,
    int? limit,
    bool? continuing,
    String? type,
  }) async {
    return await ApiHelper().getData(
      uri: api.ongoing(
        page: page,
        limit: limit,
        continuing: continuing,
        type: type,
      ),
      header: ApiHelper.header(),
      builder: (data) {
        return List.generate(data["data"].length, (index) {
          return Anime.fromJson(
            data['data'][index],
          );
        });
      },
    );
  }
}

final ongoingRepoProv = Provider((ref) {
  final api = SeasonApi();
  return OngoingRepository(api);
});
