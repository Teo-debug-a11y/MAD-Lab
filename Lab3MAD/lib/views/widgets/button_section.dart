import 'package:flutter/material.dart';

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly, //
      children: [
        _buildButtonColumn(context, Icons.call, 'CALL'),
        _buildButtonColumn(context, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(context, Icons.share, 'SHARE'),
      ],
    );
  }

  Column _buildButtonColumn(BuildContext context, IconData icon, String label) {
    final color = Theme.of(context).primaryColor;
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: color),
          ),
        ),
      ],
    );
  }
}