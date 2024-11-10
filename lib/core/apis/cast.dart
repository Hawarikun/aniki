import 'package:aniki/core/helpers/api.dart';

class CastApi {
  Uri index({required String id}) {
    return ApiHelper.buildUri(
      endpoint: "anime/$id/characters",
    );
  }
}
