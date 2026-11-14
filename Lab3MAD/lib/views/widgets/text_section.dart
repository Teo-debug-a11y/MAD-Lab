import 'package:flutter/material.dart';

class TextSection extends StatelessWidget {
  const TextSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(32.0),
      child: Text(
        'Embark on a breathtaking journey along the majestic Rajang River in Sarawak, Malaysia. '
            'Experience lush landscapes, local culture, and serene waters with our exclusive cruise packages.',
        softWrap: true,
      ),
    );
  }
}