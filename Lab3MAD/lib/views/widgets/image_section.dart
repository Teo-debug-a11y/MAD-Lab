import 'package:flutter/material.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: double.infinity,
      color: Colors.blue.shade300,
      child: const Center(
        child: Icon(Icons.directions_boat, size: 80, color: Colors.white),
      ),
    );
  }
}