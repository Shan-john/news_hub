import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final String image;
  final String title;

  final String Discription;
  NewsCard(
      {required this.image, required this.title, required this.Discription});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(bottom: 30,left: 10,right: 10),
      width: size.width-20 ,
      height: 474,
      child: Stack(
        children: [
          Positioned(
            left: 0, 
            top: 0,
            child: Container(
              width: size.width-20 ,
              height: 474,
              decoration: ShapeDecoration(
                color: const Color.fromARGB(255, 39, 39, 39),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: const ColorFilter.mode(
                      Color.fromARGB(141, 131, 131, 131), BlendMode.multiply),
                  image: NetworkImage(image),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            ),
          ),
          Positioned(
            left: 23,
            top: 330,
            child: SizedBox(
              width: 283,
              height: 23,
              child: Text(
                title,
                style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 25,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
          ),
          Positioned(
            left: 26,
            top: 380,
            child: SizedBox(
              width: 317,
              height: 60,
              child: Text(
                Discription,
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
