import 'package:aniki/core/apis/random.dart';
import 'package:aniki/core/domain/anime.dart';
import 'package:aniki/core/helpers/api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RandomAnimeRepository {
  RandomAnimeRepository(this.api);

  final RandomApi api;

  Future<Anime> index() async {
    return await ApiHelper().getData(
      uri: api.random(),
      builder: (data) {
        return Anime.fromJson(data['data']);
      },
    );
  }
}

final randomAnimeRepoProv = Provider(
  (ref) {
    final api = RandomApi();
    return RandomAnimeRepository(api);
  },
);