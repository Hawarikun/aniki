import 'dart:convert';
import 'dart:io';

import 'package:aniki/core/config/api_config.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  final http.Client client = http.Client();

  Future<T> getData<T>({
    required Uri uri,
    required T Function(dynamic data) builder,
    Map<String, String>? header,
  }) async {
    try {
      final response = await client.get(
        uri,
        headers: header,
      );
      switch (response.statusCode) {
        case HttpStatus.ok:
          final data = jsonDecode(response.body);
          return builder(data);
        case HttpStatus.notFound:
          throw Exception("endpoint not found");
        default:
          final data = jsonDecode(response.body);
          throw Exception(data.toString());
      }
    } on SocketException catch (_) {
      throw Exception("No Internet Connection");
    }
  }

  // static Uri buildUri({required String endpoint}) {
  //   var uri = Uri.parse('${ApiConfig.baseUrl}${ApiConfig.api}$endpoint');
  //   return uri;
  // }
  static Uri buildUri({required String endpoint, Map<String, String>? params}) {
    var uri = Uri(
      scheme: "https",
      host: ApiConfig.baseUrl,
      path: "${ApiConfig.api}$endpoint",
      queryParameters: params,
    );
    return uri;
  }

  static Map<String, String> header() {
    return {
      'Cache-Control': 'max-age=86400',
    };
  }
}
