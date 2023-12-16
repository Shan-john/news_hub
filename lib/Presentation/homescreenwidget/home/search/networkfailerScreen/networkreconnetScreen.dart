import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_hub/Presentation/homescreenwidget/home/home.dart';
import 'package:news_hub/constant/constantvariables.dart';
import 'package:news_hub/constant/routes.dart';
import 'package:news_hub/httpRequest/technology_http_request.dart';
import 'package:news_hub/main.dart';

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
        Routes.instance.pushreplace(widget: HomeScreen(), context: context);

        print("data got");
      } on Exception catch (e) {
        print("shan john Error :$e");
      }
    }

    return Scaffold(
      backgroundColor: HexColor("242424"),
      body: Column(
        children: [
          ///Image(image: AssetImage(Dummy.instance.poornetworkimage)),
          Container(
            height: 500,
            width: 500,
            //  child: Image.network("https://img.freepik.com/free-vector/crew-creator-building-new-company-utilize-analitics-gathering-statistic-start-production-technology-staff-operating-startup-industry-growth-vector-isolated-concept-metaphor-illustration_335657-4309.jpg?w=826&t=st=1702747088~exp=1702747688~hmac=1e8602b1882ce5ad191c77ccb893aa53ddc7de6f12150ac88cd94c1c864486d9"),
            decoration: BoxDecoration(
                //color: Colors.amber,
                image: DecorationImage(
                    image: AssetImage(Dummy.instance.poornetworkimage))),
          ),
          InkWell(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                color: HexColor("856EE9"),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Text(
                "Reconnet",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            onTap: () {
              fetchData();
            },
          )
        ],
      ),
    );
  }
}
