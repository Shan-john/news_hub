import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_hub/constant/Api.dart';
import 'package:news_hub/model/apple_article/apple_article.dart';
import 'package:news_hub/model/articles_about_bitcoin/articles_about_bitcoin.dart';
import 'package:news_hub/model/buisness/buisness.dart';

import 'package:news_hub/model/wall_street_article/wall_street_article.dart';

class ApirequestCall {
  //to call WallStreetArticle
  static ApirequestCall instance = ApirequestCall();
  Future<WallStreetArticle> wallStreetJournalApifun() async {
    final response = await http.get(Uri.parse(WallStreetJournalApi));
    final jsonbody = jsonDecode(response.body) as Map<String, dynamic>;
    final data = WallStreetArticle.fromJson(jsonbody);
    return data;
  }

// too call bitcoin

  Future<ArticlesAboutBitcoin> ArticlesAboutBitcoinApifun() async {
    final response = await http.get(Uri.parse(BitcoinApi));
    final jsonbody = jsonDecode(response.body) as Map<String, dynamic>;

    final data = ArticlesAboutBitcoin.fromJson(jsonbody);

    return data;
  }

  Future<ArticlesAboutBitcoin> ArticlesAboutteslaApifun() async {
    final response = await http.get(Uri.parse(BitcoinApi));
    final jsonbody = jsonDecode(response.body) as Map<String, dynamic>;

    final data = ArticlesAboutBitcoin.fromJson(jsonbody);

    return data;
  }

  Future<Buisness> ArticlesAboutBuisnessApifun() async {
    final response = await http.get(Uri.parse(buisnessApi));
    final jsonbody = jsonDecode(response.body) as Map<String, dynamic>;

    final data = Buisness.fromJson(jsonbody);
    return data;
  }

  Future<AppleArticle> ArticlesAboutAppleApifun() async {
    final response = await http.get(Uri.parse(buisnessApi));
    final jsonbody = jsonDecode(response.body) as Map<String, dynamic>;

    final data = AppleArticle.fromJson(jsonbody);
    return data;
  }
}
