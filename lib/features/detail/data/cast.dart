import 'package:aniki/core/apis/cast.dart';
import 'package:aniki/core/domain/cast.dart';
import 'package:aniki/core/helpers/api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnimeCastRevository {
  AnimeCastRevository(this.api);

  final CastApi api;

  Future<List<AnimeCast>> index({required String id}) async {
    return await ApiHelper().getData(
      uri: api.index(id: id),
      builder: (data) {
        return List.generate(data["data"].length, (index) {
          return AnimeCast.fromJson(data['data'][index]);
        });
      },
    );
  }
}

final animeCastRepoProv = Provider((ref) {
  final api = CastApi();
  return AnimeCastRevository(
    api,
  );
});