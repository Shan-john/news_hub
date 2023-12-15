import 'package:json_annotation/json_annotation.dart';

import 'article.dart';

part 'buisness.g.dart';

@JsonSerializable()
class Buisness {
  String? status;
  int? totalResults;
  List<Article>? articles;

  Buisness({this.status, this.totalResults, this.articles});

  factory Buisness.fromJson(Map<String, dynamic> json) {
    return _$BuisnessFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BuisnessToJson(this);
}
