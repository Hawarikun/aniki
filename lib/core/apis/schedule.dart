import 'package:aniki/core/helpers/api.dart';

class ScheduleApi {
  Uri index(String day) {
    return ApiHelper.buildUri(
      endpoint: "schedules",
      params: {
        "day": day,
        "sfw": "false",
        "kids": "false",
      },
    );
  }
}
