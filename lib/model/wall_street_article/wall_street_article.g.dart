// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wall_street_article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WallStreetArticle _$WallStreetArticleFromJson(Map<String, dynamic> json) =>
    WallStreetArticle(
      status: json['status'] as String?,
      totalResults: json['totalResults'] as int?,
      articles: (json['articles'] as List<dynamic>?)
          ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WallStreetArticleToJson(WallStreetArticle instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'articles': instance.articles,
    };
