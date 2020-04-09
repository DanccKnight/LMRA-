// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Chapter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chapter _$ChapterFromJson(Map<String, dynamic> json) {
  return Chapter(
    number: (json['number'] as num)?.toDouble(),
    images: json['images'] as List,
  );
}

Map<String, dynamic> _$ChapterToJson(Chapter instance) => <String, dynamic>{
      'number': instance.number,
      'images': instance.images,
    };
