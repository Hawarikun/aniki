import 'package:aniki/core/helpers/api.dart';

class ReviewApi {
  Uri index({required String id}) {
    return ApiHelper.buildUri(
      endpoint: "anime/$id/reviews",
    );
  }
}