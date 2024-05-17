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
      appBar: AppBar(),
      body: Consumer2<MainNewsViewModel, NewsViewModel>(
        builder: (context, mainNewsProvider, newsProvider, child) {
          return mainNewsProvider.newsTopThreeTitleList.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : Column(
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

  Expanded buildMainNewsList(
      String news, List<MainNews> mainNewsList, List<News> newsList) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black38),
          borderRadius: BorderRadius.circular(6),
        ),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(news),
              Builder(builder: (context) {
                return IconButton(
                  splashRadius: 20,
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              NewsListScreen(newsList: newsList)),
                    );
                  },
                );
              }),
            ]),
            Expanded(
              child: Center(
                child: ListView.separated(
                  itemCount: mainNewsList.length,
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
                              mainNewsList[idx].title,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(
                    height: 0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
