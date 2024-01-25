import 'package:flutter/material.dart';

class PostTitleWidget extends StatelessWidget {
  final String title;

  const PostTitleWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
    );
  }
}
