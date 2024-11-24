import 'package:aniki/core/apis/search.dart';
import 'package:aniki/core/domain/anime.dart';
import 'package:aniki/core/helpers/api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchAnimeRepository {
  SearchAnimeRepository(this.api);

  final SearchApi api;

  Future<List<Anime>> index({
    String? query,
    String? type,
    String? genre,
    String? orderby,
    String? status,
    int? page,
  }) async {
    return await ApiHelper().getData(
      uri: api.index(
        query: query,
        genres: genre,
        type: type,
        orderby: orderby,
        status: status,
        page: page,
      ),
      builder: (data) {
        return List.generate(data["data"].length, (index) {
          return Anime.fromJson(data['data'][index]);
        });
      },
    );
  }
}

final searchAnimeRepoProv = Provider(
  (ref) {
    final api = SearchApi();
    return SearchAnimeRepository(api);
  },
);
