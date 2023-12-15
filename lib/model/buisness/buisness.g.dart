// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buisness.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Buisness _$BuisnessFromJson(Map<String, dynamic> json) => Buisness(
      status: json['status'] as String?,
      totalResults: json['totalResults'] as int?,
      articles: (json['articles'] as List<dynamic>?)
          ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BuisnessToJson(Buisness instance) => <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'articles': instance.articles,
    };
