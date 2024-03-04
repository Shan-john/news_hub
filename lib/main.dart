import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_hub/Presentation/Auth/loginpage.dart';

import 'package:news_hub/Presentation/homescreenwidget/home/home.dart';
import 'package:news_hub/Presentation/networkfailerScreen/networkreconnetScreen.dart';
import 'package:news_hub/Presentation/profile/profile.dart';
import 'package:news_hub/constant/Routes.dart';
import 'package:news_hub/constant/constantvariables.dart';
import 'package:news_hub/httpRequest/technology_http_request.dart';
import 'package:connectivity/connectivity.dart';
import 'package:news_hub/service/firebase_auth_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Myapp(),
  ));
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Future<void> fetchData() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Routes.instance
          .pushreplace(widget: PoornetWortScreen(), context: context);

      return;
    }
    // HTTP request here
    try {
      Data.instance.wallStreetArticle =
          await ApirequestCall.instance.wallStreetJournalApifun();

      Data.instance.wallStreetArticle!.articles!
          .removeWhere((element) => element.urlToImage == null);

      Data.instance.articlesAboutBitcoin =
          await ApirequestCall.instance.ArticlesAboutBitcoinApifun();

      Data.instance.articlesAboutBitcoin!.articles!
          .removeWhere((element) => element.urlToImage == null);

      Data.instance.articlesAboutbuisness =
          await ApirequestCall.instance.ArticlesAboutBuisnessApifun();

      Data.instance.articlesAboutbuisness!.articles!
          .removeWhere((element) => element.urlToImage == null);

     
      MaterialPageRoute(builder: (context) {
        return StreamBuilder(
          stream: FirebaseAuth_Helper.instance.getAuthChange,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return HomeScreen();
            } else {
              return const LoginScreen();
            }
          },
        );
      });
    } on Exception catch (e) {
    
      Routes.instance
          .pushreplace(widget: PoornetWortScreen(), context: context);
    }
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 36, 36, 36),
        body: Center(
          child: Container(
              alignment: Alignment.center,
              height: 200 ,
              child: Image.asset(Customimage.instance.applogo)),
        ));
  } 
}
