import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_hub/Presentation/homescreenwidget/Homelistveiw/screen/BuisnessVeiw.dart';

import 'package:news_hub/Presentation/homescreenwidget/Homelistveiw/screen/bitcoinveiw.dart';
import 'package:news_hub/Presentation/homescreenwidget/Homelistveiw/screen/homelistviewwidget.dart';
import 'package:news_hub/Presentation/homescreenwidget/home/search/BuisnessArticleSearchpage/BuisnessArticleSearchpage.dart';
import 'package:news_hub/Presentation/homescreenwidget/home/search/WallStreetArticleSearchpage/WallstreetArticleSearchpage.dart';
import 'package:news_hub/Presentation/homescreenwidget/home/search/bitconSearch/searchScreen.dart';
import 'package:news_hub/Presentation/networkfailerScreen/networkreconnetScreen.dart';
import 'package:news_hub/Presentation/homescreenwidget/home/widget.dart';
import 'package:news_hub/Presentation/homescreenwidget/horizontalscrollwidget/horizontalSwipecard.dart';
import 'package:news_hub/Presentation/profile/profile.dart';
import 'package:news_hub/constant/constantvariables.dart';
import 'package:news_hub/constant/routes.dart';
import 'package:news_hub/model/user/user.dart';
import 'package:news_hub/service/firebase_storeage_helper.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: HexColor("242424"),
        drawer: SettingsPage(),
        body: NestedScrollView(
          headerSliverBuilder: (
            BuildContext context,
            bool innerBoxIsScrolled,
          ) {
            return [
              SliverAppBar(
                bottom: const TabBar(
                    isScrollable: true,
                    dividerColor: Color.fromARGB(255, 85, 85, 85),
                    tabs: [
                      OvalCard(title: "Home"),
                      OvalCard(title: "Buisness"),
                      OvalCard(title: "Bitcoin"),
                    ]),
                backgroundColor: HexColor("242424"),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: InkWell(
                      onTap: () {
                        int indextab = DefaultTabController.of(context).index;

                        Routes.instance.push(
                            widget: indextab == 0
                                ? WallstreetArticleSearchpage(
                                    tabindex: indextab)
                                : indextab == 1
                                    ? BuisnessArticleSearchpage(
                                        tabindex: indextab)
                                    : BitconArticleSearchPage(
                                        tabindex: indextab),
                            context: context);
                      },
                      child: const Icon(
                        Icons.search,
                        color: Color.fromARGB(224, 255, 255, 255),
                      ),
                    ),
                  ),
                ],
                title: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        icon: Icon(
                          Icons.menu,
                          color: Color.fromARGB(224, 255, 255, 255),
                          size: 25,
                        )),
                    Gap(4),
                    Text(
                      "News hub",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                elevation: 10.0,
                automaticallyImplyLeading: false,
                expandedHeight: 4,
                floating: true,
                snap: true,
              )
            ];
          },
          body: TabBarView(children: [
            FirstScreen(),
            BuisnessScreen(),
            BitcoinNewsScreen(),
          ]),
        ),
      ),
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(10),
          NewsHorizontalswipe(),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 15),
            child: Text(
              "WallStreetArticle",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          Homelistveiwwidget()
        ],
      ),
    );
  }
}

class BuisnessScreen extends StatelessWidget {
  const BuisnessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: Buisnesslistveiwwidget());
  }
}

class BitcoinNewsScreen extends StatelessWidget {
  const BitcoinNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: Bitcoinlistveiwwidget());
  }
}
