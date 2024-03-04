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
      child: Text(
        directurl,
        style: TextStyle(
            fontWeight: FontWeight.w300,
            color: Color.fromARGB(255, 0, 81, 255),
            fontSize: 15),
      ),
    );
  }
}
