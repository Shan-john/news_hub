
import 'package:news_hub/model/articles_about_bitcoin/articles_about_bitcoin.dart';
import 'package:news_hub/model/buisness/buisness.dart';
import 'package:news_hub/model/wall_street_article/wall_street_article.dart';

class Data {
  static Data instance = Data();
  WallStreetArticle? wallStreetArticle;
  ArticlesAboutBitcoin? articlesAboutBitcoin;
  Buisness? articlesAboutbuisness;

}

class Dummy {
  static Dummy instance = Dummy();
  String nullimage =
      "https://i.pinimg.com/564x/ec/8c/f6/ec8cf6d6483d6b455a45fee4debaecad.jpg";
}
