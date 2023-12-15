import 'package:json_annotation/json_annotation.dart';

import 'article.dart';

part 'articles_about_bitcoin.g.dart';

@JsonSerializable()
class ArticlesAboutBitcoin {
  String? status;
  int? totalResults;
  List<Article>? articles;

  ArticlesAboutBitcoin({this.status, this.totalResults, this.articles});

  factory ArticlesAboutBitcoin.fromJson(Map<String, dynamic> json) {
    return _$ArticlesAboutBitcoinFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ArticlesAboutBitcoinToJson(this);
}
