import 'package:aniki/core/helpers/api.dart';

class RandomApi {
  Uri random() {
    return ApiHelper.buildUri(
      endpoint: "random/anime",
    );
  }
}