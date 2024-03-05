import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_hub/Presentation/Auth/loginPage.dart';
import 'package:news_hub/Presentation/homescreenwidget/home/home.dart';
import 'package:news_hub/constant/constantvariables.dart';
import 'package:news_hub/constant/routes.dart';
import 'package:news_hub/httpRequest/technology_http_request.dart';
import 'package:news_hub/main.dart';
import 'package:news_hub/service/firebase_auth_helper.dart';

class PoornetWortScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<void> fetchData() async {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        print('No internet connection');

        return;
      }
      // HTTP request here
      try {
        Data.instance.wallStreetArticle =
            await ApirequestCall.instance.wallStreetJournalApifun();
        Data.instance.articlesAboutBitcoin =
            await ApirequestCall.instance.ArticlesAboutBitcoinApifun();
        Data.instance.articlesAboutbuisness =
            await ApirequestCall.instance.ArticlesAboutBuisnessApifun();
        MaterialPageRoute(
            builder: (context) => StreamBuilder(
                stream: FirebaseAuth_Helper.instance.getAuthChange,
                builder: (context, snapshots) {
                  if (snapshots.hasData) {
                     Routes.instance.pop(context);
                    return HomeScreen();
                  } else {
                         Routes.instance.pop(context);
                    return LoginScreen();
                  }
                }));
      } on Exception catch (e) {
        Routes.instance
            .pushreplace(widget: PoornetWortScreen(), context: context);
      }
    }

    return Scaffold(
      backgroundColor: HexColor("242424"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 380,
            width: 500,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Customimage.instance.poornetworkimage))),
          ),
          InkWell(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                color: HexColor("856EE9"),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Textwidget(text: "Retry", size: 20),
            ),
            onTap: () {
              fetchData();
            },
          ),
          Textwidget(text: "Whoops!", size: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Textwidget(
                text:
                    "No internet connection found.Check your connection or retry,",
                size: 18),
          ),
          Gap(90)
        ],
      ),
    );
  }

  Text Textwidget({required String text, required double size}) {
    return Text(
      text,
      style: TextStyle(fontSize: size, color: Colors.white),
    );
  }
}
