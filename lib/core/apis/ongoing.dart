import 'package:aniki/core/helpers/api.dart';

class OngoingApi {
  Uri index({int? page, int? limit}) {
    return ApiHelper.buildUri(
      endpoint: "seasons/now",
      params: {
        "continuing": "true",
        "page": page != null ? page.toString() : "1",
        "limit": limit != null ? limit.toString() : "5",
      },
    );
  }
}
