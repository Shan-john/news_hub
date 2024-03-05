import 'package:flutter/material.dart';
import 'package:news_hub/Presentation/homescreenwidget/newsdetailpage/widget/titleSection.dart';

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30,right: 30,bottom: 30,top: 10 ), 
      decoration: const BoxDecoration(
          color: const Color.fromARGB(255, 44, 44, 44),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            TitleSection(title: "Description:"),   
          Text(
            description,
            style: const TextStyle(
                fontWeight: FontWeight.w300,
                color: Color.fromARGB(255, 214, 214, 214),
                fontSize: 15),
          ),
        ],
      ),
    );
  }
}
