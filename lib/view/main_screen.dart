import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/main_news.dart';
import '../viewModel/main_news_view_model.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<MainNewsViewModel>(
        builder: (context, provider, child) {
          return provider.newsTopThreeTitleList.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    buildNewsListView(
                        '일반소식', provider.generalNewsTopThreeTitle),
                    buildNewsListView(
                        '장학안내', provider.scholarshipNewsTopThreeTitle),
                    buildNewsListView('행사안내', provider.eventNewsTopThreeTitle),
                    buildNewsListView(
                        '학사공지사항', provider.academicNewsTopThreeTitle),
                  ],
                );
        },
      ),
    );
  }

  Expanded buildNewsListView(String news, List<MainNews> newsList) {
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
              const Icon(Icons.add),
            ]),
            const SizedBox(height: 5),
            Expanded(
              child: Center(
                child: ListView.separated(
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
                              newsList[idx].title,
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
