import 'package:flutter/material.dart';

import 'package:news_hub/Presentation/homescreenwidget/home/home.dart';
import 'package:news_hub/constant/Routes.dart';
import 'package:news_hub/constant/constantvariables.dart';
import 'package:news_hub/httpRequest/technology_http_request.dart';
import 'package:connectivity/connectivity.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
    Future.delayed(const Duration(seconds: 2), () {
      Routes.instance.pushreplace(widget: HomeScreen(), context: context);
    });
    super.initState();
  }

  Future<void> fetchData() async {
    
    // HTTP request here
    try {
      Data.instance.wallStreetArticle =
          await ApirequestCall.instance.wallStreetJournalApifun();
      Data.instance.articlesAboutBitcoin =
          await ApirequestCall.instance.ArticlesAboutBitcoinApifun();
      Data.instance.articlesAboutbuisness =
          await ApirequestCall.instance.ArticlesAboutBuisnessApifun(); 
          print("data got");
    } on Exception catch (e) {
      print(e);
    }

    
   
    
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Container(
          alignment: Alignment.center,
          height: double.infinity,
          width: double.infinity,
          child: Text("welcome")),
    );
  }
}
