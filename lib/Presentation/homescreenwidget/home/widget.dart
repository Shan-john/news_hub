import 'package:flutter/material.dart';

class OvalCard extends StatelessWidget {
  final String title;
  const OvalCard({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5, bottom: 10),
      width: 100,
      height: 35,
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 27, 27, 27),
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          )),
      child: Center(
          child: Text(
        title,
        style: const TextStyle(
          color: Color.fromARGB(255, 221, 221, 221),
          fontSize: 17,
        ),
      )),
    );
  }
}
