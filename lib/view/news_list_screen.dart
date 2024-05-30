import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../model/news.dart';
import '../viewModel/news_view_model.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({super.key, required this.title});

  final String title;

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  late ScrollController _scrollController;
  bool hasScrollListener = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final newsViewModel = context.watch<NewsViewModel>();

    void scrollListener() {
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        newsViewModel.addNewsList(widget.title);
      }
    }

    if (!hasScrollListener) {
      _scrollController.addListener(scrollListener);
      hasScrollListener = true;
    }

    List<News> newsList = List.empty(growable: true);

    switch (widget.title) {
      case '일반소식':
        newsList = context.watch<NewsViewModel>().generalNews;
        break;
      case '장학안내':
        newsList = context.watch<NewsViewModel>().scholarshipNews;
        break;
      case '행사안내':
        newsList = context.watch<NewsViewModel>().eventNews;
        break;
      case '학사공지사항':
        newsList = context.watch<NewsViewModel>().academicNews;
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: newsList.length,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 2),
            child: Card(
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () async {
                  try {
                    await launchUrl(Uri.parse(newsList[index].contentURL!));
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
            ),
          );
        }),
      ),
    );
  }
}
