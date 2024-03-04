import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_hub/Presentation/homescreenwidget/newsdetailpage/widget/contentSection.dart';
import 'package:news_hub/Presentation/homescreenwidget/newsdetailpage/widget/descriptionSection.dart';
import 'package:news_hub/Presentation/homescreenwidget/newsdetailpage/widget/imageSection.dart';
import 'package:news_hub/Presentation/homescreenwidget/newsdetailpage/widget/linkSection.dart';
import 'package:news_hub/Presentation/homescreenwidget/newsdetailpage/widget/speakerwidget.dart';
import 'package:news_hub/Presentation/homescreenwidget/newsdetailpage/widget/titleSection.dart';
import 'package:news_hub/constant/routes.dart';

class NewsDetailScreen extends StatelessWidget {
  final int animationtagindex;
  final String imageurl;
  final String title;
  final String description;
  final String directurl;

  final String content;
  const NewsDetailScreen(
      {super.key,
      required this.animationtagindex,
      required this.imageurl,
      required this.title,
      required this.description,
      required this.content,
      required this.directurl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("242424"),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(30),
              InkWell(
                onTap: () {
                  Routes.instance.pop(context);
                },
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.white,
                    )),
              ),
              const Gap(20),
              ImageSection(
                  animationtagindex: animationtagindex, imageurl: imageurl),
              Gap(10),
              TitleSection(title: title),
              Gap(5),
              Align(
                  alignment: Alignment.centerLeft,
                  child: SpeakerButton(
                    content: content,
                  )),
              Gap(5),
              DescriptionSection(description: description),
              Gap(10),
              ContentSection(content: content),
              Gap(15),
              LinkSection(directurl: directurl),
              Gap(50)
            ],
          ),
        ),
      ),
    );
  }
}
