import 'package:flutter/material.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:news_hub/Presentation/homescreenwidget/Homelistveiw/newscard.dart';
import 'package:news_hub/Presentation/homescreenwidget/home/widget.dart';
import 'package:news_hub/Presentation/homescreenwidget/newsdetailpage/newsDetailpage.dart';
import 'package:news_hub/constant/constantvariables.dart';
import 'package:news_hub/constant/routes.dart';

// import 'package:news_hub/model/wall_street_article/article.dart';

import 'package:news_hub/model/wall_street_article/article.dart';

class WallstreetArticleSearchpage extends StatefulWidget {
  const WallstreetArticleSearchpage({super.key, required this.tabindex});
  final int tabindex;

  @override
  State<WallstreetArticleSearchpage> createState() => _SearchPageState();
}

class _SearchPageState extends State<WallstreetArticleSearchpage> {
  TextEditingController searchItemTextController = TextEditingController();

  List<Article> dataSearchlist = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor("242424"),
        appBar: AppBar(
          backgroundColor: HexColor("242424"),
          flexibleSpace: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 350,
                  child: TextField(
                    controller: searchItemTextController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: "Search here",
                        hintStyle: TextStyle(
                            color: const Color.fromARGB(255, 112, 112, 112)),
                        suffixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50))),
                    onChanged: (value) {
                      dataSearchlist = searchArticle(value);

                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Padding(
            padding: EdgeInsets.only(top: 10),
            child: dataSearchlist.isNotEmpty
                ? ListView.builder(
                    itemCount: dataSearchlist.length,
                   
                    itemBuilder: (context, index) {
                      final article = dataSearchlist[index];

                      return InkWell(
                        onTap: () => Routes.instance.push(widget:  NewsDetailScreen(
                            animationtagindex: index,
                            imageurl: article.urlToImage!,
                            title: article.title!,
                            description: article.description!,
                            content: article.content!,
                            directurl: article.url!), context: context),
                        child: NewsCard(
                            image: article.urlToImage ??
                                Customimage.instance.nullimage,
                            title: article.title ?? "dcc",
                            Discription: article.description ?? "Ddd"),
                      );
                    })
                : const Center(
                    child: Text(
                    "Search",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ))));
  }

  List<Article> searchArticle(String value) {
    return
      
        Data.instance.wallStreetArticle!.articles!
            .where((element) =>
                element.title.toString().contains(value.toLowerCase()) ||
                element.description.toString().contains(value.toLowerCase()))
            .toList();
    
  }
}
 
