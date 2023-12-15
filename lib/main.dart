import 'package:flutter/material.dart';

import 'package:news_hub/Presentation/homescreenwidget/home/home.dart';
import 'package:news_hub/constant/Routes.dart';
import 'package:news_hub/constant/constantvariables.dart';
import 'package:news_hub/httpRequest/technology_http_request.dart';
import 'package:connectivity/connectivity.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
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

    Future.delayed(Duration(seconds: 2), () {
      print("33");
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });
    super.initState();
  }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Text("welcome")),
    );
  }
}





Future<void> fetchData() async {
  // var connectivityResult = await (Connectivity().checkConnectivity());
  // if (connectivityResult == ConnectivityResult.none) {
  //   print('No internet connection');
  //   return;
  // }

  // Make your HTTP request here
  Data.instance.wallStreetArticle =
      await ApirequestCall.instance.wallStreetJournalApifun();
  Data.instance.articlesAboutBitcoin =
      await ApirequestCall.instance.ArticlesAboutBitcoinApifun();
  Data.instance.articlesAboutbuisness =
      await ApirequestCall.instance.ArticlesAboutBuisnessApifun();

}
