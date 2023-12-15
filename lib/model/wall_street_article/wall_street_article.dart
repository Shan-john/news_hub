import 'package:json_annotation/json_annotation.dart';

import 'article.dart';

part 'wall_street_article.g.dart';

@JsonSerializable()
class WallStreetArticle {
  String? status;
  int? totalResults;
  List<Article>? articles;

  WallStreetArticle({this.status, this.totalResults, this.articles});

  factory WallStreetArticle.fromJson(Map<String, dynamic> json) {
    return _$WallStreetArticleFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WallStreetArticleToJson(this);
}
