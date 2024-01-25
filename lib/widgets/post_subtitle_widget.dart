import 'package:flutter/material.dart';

class PostSubtitleWidget extends StatelessWidget {
  final String subtitle;

  const PostSubtitleWidget({required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      style: const TextStyle(color: Colors.white,fontSize: 14.0),
    );
  }
}
