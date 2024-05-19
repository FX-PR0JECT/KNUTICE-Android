import 'package:fcmtest/viewModel/news_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/main_news.dart';
import '../model/news.dart';
import '../viewModel/main_news_view_model.dart';
import '../view/news_list_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KNUTICE'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
        elevation: 0,
      ),
      body: Consumer2<MainNewsViewModel, NewsViewModel>(
        builder: (context, mainNewsProvider, newsProvider, child) {
          return mainNewsProvider.newsTopThreeTitleList.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView(
                  children: [
                    buildMainNewsList(
                      '일반소식',
                      mainNewsProvider.generalNewsTopThreeTitle,
                      newsProvider.generalNews,
                    ),
                    buildMainNewsList(
                      '장학안내',
                      mainNewsProvider.scholarshipNewsTopThreeTitle,
                      newsProvider.scholarshipNews,
                    ),
                    buildMainNewsList(
                      '행사안내',
                      mainNewsProvider.eventNewsTopThreeTitle,
                      newsProvider.eventNews,
                    ),
                    buildMainNewsList(
                      '학사공지사항',
                      mainNewsProvider.academicNewsTopThreeTitle,
                      newsProvider.academicNews,
                    ),
                  ],
                );
        },
      ),
    );
  }

  Builder buildMainNewsList(
      String news, List<MainNews> mainNewsList, List<News> newsList) {
    return Builder(builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NewsListScreen(newsList: newsList)),
              );
            },
            child: Text(
              '$news 〉',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          for (int i = 0; i < 3; i++)
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 2),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          mainNewsList[i].title,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              '${mainNewsList[i].departName} ${mainNewsList[i].registrationDate}',
                              style: Theme.of(context).textTheme.bodySmall,
                            )
                          ],
                        )
                      ]),
                ),
              ),
            ),
          const SizedBox(
            height: 20,
          ),
        ],
      );
    });
  }
}
