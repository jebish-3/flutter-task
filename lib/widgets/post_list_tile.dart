import 'package:flutter/material.dart';
import 'post_title_widget.dart';
import 'post_subtitle_widget.dart';

class PostListTile extends StatelessWidget {
  final dynamic item;

  const PostListTile({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      color:Colors.pink,
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PostTitleWidget(title: item['title']),
            const SizedBox(height: 8.0),
            PostSubtitleWidget(subtitle: item['body']),
          ],
        ),
      ),
    );
  }
}
