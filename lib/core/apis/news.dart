import 'package:aniki/core/helpers/api.dart';

class NewsApi {
  Uri index(String id) {
    return ApiHelper.buildUri(
      endpoint: "anime/$id/news",
    );
  }
}