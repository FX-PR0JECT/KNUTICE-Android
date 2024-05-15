import 'package:flutter/material.dart';
import '../model/news.dart';
import '../dataSource/data_source.dart';

class NewsViewModel with ChangeNotifier {
  late final DataSource _dataSource;
  List<News> _generalNews = List.empty(growable: true);
  List<News> _scholarshipNews = List.empty(growable: true);
  List<News> _eventNews = List.empty(growable: true);
  List<News> _academicNews = List.empty(growable: true);

  List<News> get generalNews => _generalNews;
  List<News> get scholarshipNews => _scholarshipNews;
  List<News> get eventNews => _eventNews;
  List<News> get academicNews => _academicNews;

  NewsViewModel() {
    _dataSource = DataSource();
    _getNewsList();
  }

  Future<void> _getNewsList() async {
    _generalNews = await _dataSource.fetchNews('generalNews');
    _scholarshipNews = await _dataSource.fetchNews('scholarshipNews');
    _eventNews = await _dataSource.fetchNews('eventNews');
    _academicNews = await _dataSource.fetchNews('academicNews');
    notifyListeners();
  }
}
