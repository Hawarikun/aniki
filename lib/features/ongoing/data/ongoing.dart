import 'package:aniki/core/apis/ongoing.dart';
import 'package:aniki/core/domain/anime.dart';
import 'package:aniki/core/helpers/api.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class OngoingRepository {
  OngoingRepository(this.api);

  final OngoingApi api;

  Future<List<Anime>> index({int? page, int? limit, bool? continuing, String? type,}) async {
    return await ApiHelper().getData(
      uri: api.index(
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
  final api = OngoingApi();
  return OngoingRepository(
    api,
  );
});
