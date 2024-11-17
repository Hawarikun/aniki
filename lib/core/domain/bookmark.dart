// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';

part 'bookmark.g.dart';

@JsonSerializable()
class Bookmark {
  final int mal_id;
  final String title;
  final double? score;
  final String? image;

  const Bookmark({
    required this.mal_id,
    required this.title,
    required this.score,
    required this.image,
  });

  factory Bookmark.fromJson(Map<String, dynamic> json) => _$BookmarkFromJson(json);

  Map<String, dynamic> toJson() => _$BookmarkToJson(this);
}
