import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NewsDetailScreen extends StatelessWidget {
  final int animationtagindex;
  final String imageurl;

  const NewsDetailScreen(
      {super.key, required this.animationtagindex, required this.imageurl});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Gap(20),
            Hero(
              tag: 'tag1$animationtagindex',
              child: Container(
                width: 379,
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
            ),
            //  Align(
            //  // alignment: Alignment(1, 3),
            //   child: ,)
          ],
        ),
      ),
    );
  }
}

// child: Stack(
//               children: [
//                 Positioned(
//                   left: 16,
//                   top: 27,
//                   child: Container(
//                     width: 379,
//                     height: 366,
//                     child: Stack(
//                       children: [
//                         Positioned(
//                           left: 0,
//                           top: 0,
//                           child: Container(
//                              width: 379,
//            height: 366,
//                             decoration: ShapeDecoration(
//                               image: DecorationImage(
//                                 image: NetworkImage("https://via.placeholder.com/379x358"),
//                                 fit: BoxFit.fill,
//                               ),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(24),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           left: 31,
//                           top: 387,
//                           child: SizedBox(
//                             width: 283,
//                             height: 23,
//                             child: Text(
//                               'title',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 25,
//                                 fontFamily: 'Inter',
//                                 fontWeight: FontWeight.w400,
//                                 height: 0,
//                               ),
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           left: 31,
//                           top: 431,
//                           child: SizedBox(
//                             width: 317,
//                             height: 36,
//                             child: Text(
//                               'discriptiondescription ',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 15,
//                                 fontStyle: FontStyle.italic,
//                                 fontFamily: 'Inter',
//                                 fontWeight: FontWeight.w400,
//                                 height: 0,
//                               ),
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           left: 21,
//                           top: 467,
//                           child: SizedBox(
//                             width: 345,
//                             height: 18,
//                             child: Text(
//                               'content',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 15,
//                                 fontStyle: FontStyle.italic,
//                                 fontFamily: 'Inter',
//                                 fontWeight: FontWeight.w400,
//                                 height: 0,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: 274,
//                   top: 438,
//                   child: SizedBox(
//                     width: 108,
//                     height: 12,
//                     child: Text(
//                       'publishedAt',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 15,
//                         fontStyle: FontStyle.italic,
//                         fontFamily: 'Inter',
//                         fontWeight: FontWeight.w400,
//                         height: 0,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
