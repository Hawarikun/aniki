import 'package:aniki/core/helpers/api.dart';

class DetailApi {
  Uri detail({required String animeId}) {
    return ApiHelper.buildUri(
      endpoint: "anime/$animeId/full",
    );
  }
}
