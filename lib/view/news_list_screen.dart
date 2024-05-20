import 'package:flutter/material.dart';
import '../model/news.dart';

class NewsListScreen extends StatelessWidget {
  const NewsListScreen({super.key, required this.newsList});

  final List<News> newsList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
        itemCount: newsList.length,
        itemBuilder: (BuildContext ctx, int idx) {
          return MaterialButton(
            height: 40,
            onPressed: () {},
            child: Row(
              children: [
                const Text(
                  '· ',
                  style: TextStyle(
                    color: Colors.lightBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Text(
                    newsList[idx].title ?? 'null',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(
          height: 0,
        ),
      ),
    );
  }
}
