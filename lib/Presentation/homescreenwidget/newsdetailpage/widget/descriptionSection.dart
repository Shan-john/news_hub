import 'package:flutter/material.dart';

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: const TextStyle(
          fontWeight: FontWeight.w300,
          color: Color.fromARGB(255, 214, 214, 214),
          fontSize: 15),
    );
  }
}
