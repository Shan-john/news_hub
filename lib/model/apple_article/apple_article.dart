import 'package:json_annotation/json_annotation.dart';

import 'article.dart';

part 'apple_article.g.dart';

@JsonSerializable()
class AppleArticle {
  String? status;
  int? totalResults;
  List<Article>? articles;

  AppleArticle({this.status, this.totalResults, this.articles});

  factory AppleArticle.fromJson(Map<String, dynamic> json) {
    return _$AppleArticleFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AppleArticleToJson(this);
}
