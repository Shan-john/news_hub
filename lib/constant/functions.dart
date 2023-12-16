import 'package:url_launcher/url_launcher.dart';


  void launchweb({required String url}) async {
    final _url = Uri.parse('${url}');

    try {
      await launchUrl(_url);
    } catch (e) { 
      print("shan jon$e");
    }
  }