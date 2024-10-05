import 'package:aniki/core/helpers/api.dart';

class TopAnimeApi {
  Uri index({int? page, int? limit}) {
    return ApiHelper.buildUri(
      endpoint: "top/anime",
      params: {
        "page": page != null ? page.toString() : "1",
        "limit": limit != null ? limit.toString() : "5",
      },
    );
  }
}
