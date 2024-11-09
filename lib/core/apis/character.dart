import 'package:aniki/core/helpers/api.dart';

class CharacterApi {
  Uri index({required String id}) {
    return ApiHelper.buildUri(
      endpoint: "anime/$id/characters",
    );
  }
}
