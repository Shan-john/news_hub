import 'package:flutter/material.dart';

class ContentSection extends StatelessWidget {
  const ContentSection({
    super.key,
    required this.content,
  });

  final String content;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$content read more... ",
      style: const TextStyle(
          fontWeight: FontWeight.w300,
          color: Color.fromARGB(255, 214, 214, 214),
          fontSize: 15),
    );
  }
}
