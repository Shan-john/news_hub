import 'package:flutter/material.dart';
import 'package:news_hub/constant/functions.dart';

class LinkSection extends StatelessWidget {
  const LinkSection({
    super.key,
    required this.directurl,
  });

  final String directurl;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        launchweb(url: directurl);
      },
      child: Container(
         padding: EdgeInsets.all(20),  
        decoration:   const BoxDecoration(  
          color: Color.fromARGB(255, 22, 41, 58),
          borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Center( 
          child: Text( 
            directurl,
            style: TextStyle(
                fontWeight: FontWeight.w300,
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 15),
          ),
        ),
      ),
    );
  }
}
