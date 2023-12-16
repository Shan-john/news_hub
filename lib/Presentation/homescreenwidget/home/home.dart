import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_hub/Presentation/homescreenwidget/Homelistveiw/screen/BuisnessVeiw.dart';

import 'package:news_hub/Presentation/homescreenwidget/Homelistveiw/screen/bitcoinveiw.dart';
import 'package:news_hub/Presentation/homescreenwidget/Homelistveiw/screen/homelistviewwidget.dart';
import 'package:news_hub/Presentation/homescreenwidget/home/search/networkfailerScreen/networkreconnetScreen.dart';
import 'package:news_hub/Presentation/homescreenwidget/home/widget.dart';
import 'package:news_hub/Presentation/homescreenwidget/horizontalscrollwidget/horizontalSwipecard.dart';



class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    updateWidget();
    super.initState();
  }

  Future<void> updateWidget() async {
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        
      });
    });

    print("data got");
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: HexColor("242424"),
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
                    padding: const EdgeInsets.only(right: 35.0),
                    child: InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.search,
                        color: Color.fromARGB(224, 255, 255, 255),
                      ),
                    ),
                  )
                ],
                title: const Text(
                  "News hub",
                  style: TextStyle(
                    color: Colors.white,
                  ),
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
            FirstScreen() ,
             BuisnessScreen() ,
             BitcoinNewsScreen() ,
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
