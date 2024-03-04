import 'package:flutter/material.dart';
import 'package:news_hub/Presentation/homescreenwidget/Homelistveiw/newscard.dart';
import 'package:news_hub/Presentation/homescreenwidget/newsdetailpage/newsDetailpage.dart';
import 'package:news_hub/constant/constantvariables.dart';

class Buisnesslistveiwwidget extends StatelessWidget {
  const Buisnesslistveiwwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      physics: const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
      itemCount: Data.instance.articlesAboutbuisness?.articles?.length,
      itemBuilder: (BuildContext context, int index) {
        final newsdata = Data.instance.articlesAboutbuisness?.articles?[index];
        String imageUrl =
            newsdata?.urlToImage ?? Customimage.instance.nullimage;
        String title = newsdata?.title ?? "";
        String description = newsdata?.description ?? "";
        String content = newsdata?.content ?? "";
        String directurl = newsdata?.url ?? "";
        return InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return NewsDetailScreen(
                    directurl: directurl,
                    content: content,
                    description: description,
                    title: title,
                    imageurl: imageUrl,
                    animationtagindex: index,
                  );
                },
              ),
            );
          },
          child: Center(
            child: Hero(
              tag: 'tag1${index}',
              child: NewsCard(
                  image: imageUrl,
                  title: title,
                  Discription: newsdata?.description ?? ""),
            ),
          ),
        );
      },
    );
  }
}
