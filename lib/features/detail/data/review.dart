import 'package:aniki/core/apis/review.dart';
import 'package:aniki/core/domain/review.dart';
import 'package:aniki/core/helpers/api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReviewRepository {
  ReviewRepository(this.api);

  final ReviewApi api;

  Future<List<Review>> index({required String id}) async {
    return await ApiHelper().getData(
      uri: api.index(id: id),
      builder: (data) {
        return List.generate(data["data"].length, (index) {
          return Review.fromJson(data['data'][index]);
        });
      },
    );
  }
}

final reviewRepoProv = Provider((ref) {
  final api = ReviewApi();

  return ReviewRepository(api);
});
