import 'package:json_annotation/json_annotation.dart';

part 'seasons.g.dart';

@JsonSerializable()
class Seasons {
  int? year;
  List<String>? seasons;

  Seasons({
    this.year,
    this.seasons,
  });

  factory Seasons.fromJson(Map<String, dynamic> json) => _$SeasonsFromJson(json);

  Map<String, dynamic> toJson() => _$SeasonsToJson(this);
}
