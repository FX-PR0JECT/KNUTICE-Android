import 'package:flutter/material.dart';
import '../model/news.dart';

class NewsListScreen extends StatelessWidget {
  const NewsListScreen(
      {super.key, required this.title, required this.newsList});

  final String title;
  final List<News> newsList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: newsList.length,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 2),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        newsList[index].title ?? 'null',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            '${newsList[index].departName} ${newsList[index].registrationDate}',
                            style: Theme.of(context).textTheme.bodySmall,
                          )
                        ],
                      )
                    ]),
              ),
            ),
          );
        }),
      ),
    );
  }
}
