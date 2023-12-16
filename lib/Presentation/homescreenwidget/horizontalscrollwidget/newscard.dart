import 'package:flutter/material.dart';

class HorizontalNewsSwipeCardWidget extends StatelessWidget {
  final String title;
  final String image;
  HorizontalNewsSwipeCardWidget({required this.title, required this.image});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 330,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 245,
                  height: 330,
                  decoration: ShapeDecoration(
                    color: const Color.fromARGB(255, 39, 39, 39),
                    image: DecorationImage(
                      image: NetworkImage(image),
                      fit: BoxFit.cover,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 13,
                top: 260,
                child: SizedBox(
                  width: 230,
                  height: 40,
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
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
        ),
      ],
    );
  }
}
