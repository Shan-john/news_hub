// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apple_article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppleArticle _$AppleArticleFromJson(Map<String, dynamic> json) => AppleArticle(
      status: json['status'] as String?,
      totalResults: json['totalResults'] as int?,
      articles: (json['articles'] as List<dynamic>?)
          ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AppleArticleToJson(AppleArticle instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'articles': instance.articles,
    };
