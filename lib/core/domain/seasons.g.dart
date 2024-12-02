// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seasons.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Seasons _$SeasonsFromJson(Map<String, dynamic> json) => Seasons(
      year: (json['year'] as num?)?.toInt(),
      seasons:
          (json['seasons'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$SeasonsToJson(Seasons instance) => <String, dynamic>{
      'year': instance.year,
      'seasons': instance.seasons,
    };
