import 'package:aniki/core/apis/news.dart';
import 'package:aniki/core/domain/news.dart';
import 'package:aniki/core/helpers/api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewsRepository {
  NewsRepository(this.api);

  final NewsApi api;

  Future<List<News>> getNews(String id) async {
    return await ApiHelper().getData(
      uri: api.index(id),
      builder: (data) {
        return List.generate(data["data"].length, (index) {
          return News.fromJson(data['data'][index]);
        });
      },
    );
  }
}

final newsRepoProv = Provider(
  (ref) {
    final api = NewsApi();
    return NewsRepository(api);
  },
);
