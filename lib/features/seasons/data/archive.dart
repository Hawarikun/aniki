import 'package:aniki/core/apis/seasons.dart';
import 'package:aniki/core/domain/seasons.dart';
import 'package:aniki/core/helpers/api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArchiveRepository {
  ArchiveRepository(this.api);

  SeasonApi api;

  Future<List<Seasons>> index() async {
    return await ApiHelper().getData(
      uri: api.getAllSeason(),
      builder: (data) {
        return List.generate(
          data["data"].length,
          (index) {
            return Seasons.fromJson(data['data'][index]);
          },
        );
      },
    );
  }
}

final archiveRepoProv = Provider(
  (ref) {
    final api = SeasonApi();
    return ArchiveRepository(api);
  },
);
