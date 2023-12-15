import 'package:json_annotation/json_annotation.dart';

import 'article.dart';

part 'tech_crunch.g.dart';

@JsonSerializable()
class TechCrunch {
  String? status;
  int? totalResults;
  List<Article>? articles;

  TechCrunch({this.status, this.totalResults, this.articles});

  factory TechCrunch.fromJson(Map<String, dynamic> json) {
    return _$TechCrunchFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TechCrunchToJson(this);
}
