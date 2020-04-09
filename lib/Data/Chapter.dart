import 'package:json_annotation/json_annotation.dart';

part 'Chapter.g.dart';

@JsonSerializable()
class Chapter{
  double number;
  List images;

  Chapter({this.number,this.images});

  factory Chapter.fromJson(Map<String, dynamic> json) => _$ChapterFromJson(json);
}