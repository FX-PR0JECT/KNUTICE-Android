import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../model/main_news.dart';
import '../viewModel/main_news_view_model.dart';
import '../viewModel/news_view_model.dart';
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
      body: Consumer<MainNewsViewModel>(
        builder: (context, mainNewsProvider, child) {
          return mainNewsProvider.newsTopThreeTitleList.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView(
                  children: [
                    buildMainNewsList(
                      '일반소식',
                      mainNewsProvider.generalNewsTopThreeTitle,
                    ),
                    buildMainNewsList(
                      '장학안내',
                      mainNewsProvider.scholarshipNewsTopThreeTitle,
                    ),
                    buildMainNewsList(
                      '행사안내',
                      mainNewsProvider.eventNewsTopThreeTitle,
                    ),
                    buildMainNewsList(
                      '학사공지사항',
                      mainNewsProvider.academicNewsTopThreeTitle,
                    ),
                  ],
                );
        },
      ),
    );
  }

  Builder buildMainNewsList(String news, List<MainNews> mainNewsList) {
    return Builder(builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => ChangeNotifierProvider(
                    create: (context) => NewsViewModel(),
                    builder: (context, child) => NewsListScreen(title: news),
                  ),
                ),
              );
            },
            child: Text(
              '$news 〉',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          if (mainNewsList.isNotEmpty)
            for (int i = 0; i < 3; i++)
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 2),
                child: Card(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () async {
                      try {
                        await launchUrl(Uri.parse(mainNewsList[i].contentURL!));
                      } catch (e) {
                        // print('launchUrl 에러');
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              mainNewsList[i].title ?? 'null',
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
              ),
          const SizedBox(
            height: 20,
          ),
        ],
      );
    });
  }
}
