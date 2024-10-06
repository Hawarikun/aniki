import 'package:aniki/core/helpers/api.dart';

class SearchApi {
  Uri index(
      {required String? query,
      String? type,
      String? genres,
      String? status,
      String? orderby,
      String? sort,
      String? page}) {
    return ApiHelper.buildUri(
      endpoint: "anime",
      params: {
        "q": query ?? "",
        "genres": genres ?? "",
        "sort": sort ?? "",
        "type": type ?? "",
        "status": status ?? "",
        "order_by": orderby ?? "title",
        "page": page ?? "1",
      },
    );
  }
}
