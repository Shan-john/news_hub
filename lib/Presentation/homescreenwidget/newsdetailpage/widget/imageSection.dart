
import 'package:flutter/material.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({
    super.key,
    required this.animationtagindex,
    required this.imageurl,
  });

  final int animationtagindex;
  final String imageurl;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'tag1$animationtagindex',
      child: Container(
        width: MediaQuery.of(context).size.width-10,
        height: 366,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Color.fromARGB(141, 177, 177, 177),
                    BlendMode.multiply),
                fit: BoxFit.cover,
                image: NetworkImage(imageurl)),
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: Color(0xFF242424)),
      ),
    );
  }
}

