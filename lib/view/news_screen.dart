import 'package:flutter/material.dart';
import '../model/news.dart';

class NewsScreen extends StatelessWidget {
  final News news;

  const NewsScreen({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Text(
              news.title ?? 'null',
              style: const TextStyle(fontSize: 20),
            ),
            Text(news.departName ?? 'null'),
            Text(news.registrationDate ?? 'null'),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
