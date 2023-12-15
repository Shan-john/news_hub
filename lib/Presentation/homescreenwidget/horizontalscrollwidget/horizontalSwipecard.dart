import 'package:card_swiper/card_swiper.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:news_hub/Presentation/homescreenwidget/horizontalscrollwidget/newscard.dart';
import 'package:news_hub/Presentation/homescreenwidget/newsdetailpage/newsDetailpage.dart';
import 'package:news_hub/constant/constantvariables.dart';
import 'package:news_hub/model/articles_about_bitcoin/article.dart';
import 'package:news_hub/model/buisness/buisness.dart';

class NewsHorizontalswipe extends StatefulWidget {
  const NewsHorizontalswipe({
    super.key,
  });

  @override
  State<NewsHorizontalswipe> createState() => _NewsHorizontalswipeState();
}

int _currentpageindex = 0;

class _NewsHorizontalswipeState extends State<NewsHorizontalswipe> {
  //@override
  // void initState() {

  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 330,
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              _currentpageindex = index;
              final newsdata =
                  Data.instance.articlesAboutbuisness?.articles![index];
              String imageUrl =
                  newsdata?.urlToImage ?? Dummy.instance.nullimage;
              String title = newsdata?.title ?? "";
              return InkWell(
                child: HorizontalNewsSwipeCardWidget(
                  image: imageUrl,
                  title: title,
                ),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return NewsDetailScreen(
                      animationtagindex: index,
                      imageurl: imageUrl,
                    );
                  }));
                },
              );
            },

            onIndexChanged: (value) {
              _currentpageindex = value;

              setState(() {});
            },
            itemCount: 5,
            loop: false,
            viewportFraction: 0.6,
            scale: 0.7,
            //  indicatorLayout: PageIndicatorLayout.,
          ),
        ),
        const Gap(10),
        dotScrollIndicator()
      ],
    );
  }

  DotsIndicator dotScrollIndicator() {
    return DotsIndicator(
      dotsCount: 5,
      position: _currentpageindex,
      decorator: DotsDecorator(
        size: const Size.square(9.0),
        activeSize: const Size(19.0, 9.0),
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }
}
