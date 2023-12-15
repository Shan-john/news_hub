// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articles_about_bitcoin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticlesAboutBitcoin _$ArticlesAboutBitcoinFromJson(
        Map<String, dynamic> json) =>
    ArticlesAboutBitcoin(
      status: json['status'] as String?,
      totalResults: json['totalResults'] as int?,
      articles: (json['articles'] as List<dynamic>?)
          ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ArticlesAboutBitcoinToJson(
        ArticlesAboutBitcoin instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'articles': instance.articles,
    };
