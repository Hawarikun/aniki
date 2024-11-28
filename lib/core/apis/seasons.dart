import 'package:aniki/core/helpers/api.dart';

class SeasonApi {
  Uri ongoing({int? page, int? limit, bool? continuing, String? type}) {
    return ApiHelper.buildUri(
      endpoint: "seasons/now",
      params: {
        "continuing":
            continuing != null ? continuing.toString() : true.toString(),
        "page": page != null ? page.toString() : "1",
        "limit": limit != null ? limit.toString() : "5",
        "filter": type ?? "",
      },
    );
  }

  Uri upcoming({int? page, int? limit, bool? continuing, String? type}) {
    return ApiHelper.buildUri(
      endpoint: "seasons/upcoming",
      params: {
        "continuing":
            continuing != null ? continuing.toString() : true.toString(),
        "page": page != null ? page.toString() : "1",
        "filter": type ?? "",
      },
    );
  }
}
