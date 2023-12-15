// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tech_crunch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TechCrunch _$TechCrunchFromJson(Map<String, dynamic> json) => TechCrunch(
      status: json['status'] as String?,
      totalResults: json['totalResults'] as int?,
      articles: (json['articles'] as List<dynamic>?)
          ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TechCrunchToJson(TechCrunch instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'articles': instance.articles,
    };
