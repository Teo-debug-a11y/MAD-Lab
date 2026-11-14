import 'package:flutter/material.dart';

class TitleSection extends StatefulWidget {
  const TitleSection({super.key});

  @override
  State<TitleSection> createState() => _TitleSectionState();
}

class _TitleSectionState extends State<TitleSection> {
  // State for dynamic/interactive star rating counter
  int _ratingCount = 41;
  bool _isStarred = true;

  void _toggleRating() {
    setState(() {
      if (_isStarred) {
        _ratingCount -= 1;
        _isStarred = false;
      } else {
        _ratingCount += 1;
        _isStarred = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Rajang River Cruise',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  'Sarawak, Malaysia',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              _isStarred ? Icons.star : Icons.star_border,
              color: Colors.red[500],
            ),
            onPressed: _toggleRating,
          ),
          Text('$_ratingCount'),
        ],
      ),
    );
  }
}