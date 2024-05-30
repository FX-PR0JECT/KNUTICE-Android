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

  late int _generalNewsStartBoardNumber;
  late int _scholarshipNewsStartBoardNumber;
  late int _eventNewsStartBoardNumber;
  late int _academicNewsStartBoardNumber;

  NewsViewModel() {
    _dataSource = DataSource();
    _getNewsList();
  }

  Future<void> _getNewsList() async {
    _generalNewsStartBoardNumber =
        await _dataSource.getStartBoardNumber('generalNews');
    _scholarshipNewsStartBoardNumber =
        await _dataSource.getStartBoardNumber('scholarshipNews');
    _eventNewsStartBoardNumber =
        await _dataSource.getStartBoardNumber('eventNews');
    _academicNewsStartBoardNumber =
        await _dataSource.getStartBoardNumber('academicNews');

    _generalNews = await _dataSource.fetchNews(
        'generalNews', _generalNewsStartBoardNumber + 1);
    _scholarshipNews = await _dataSource.fetchNews(
        'scholarshipNews', _scholarshipNewsStartBoardNumber + 1);
    _eventNews = await _dataSource.fetchNews(
        'eventNews', _eventNewsStartBoardNumber + 1);
    _academicNews = await _dataSource.fetchNews(
        'academicNews', _academicNewsStartBoardNumber + 1);

    notifyListeners();
  }

  Future<void> addNewsList(String title) async {
    switch (title) {
      case '일반소식':
        if (_generalNews.isNotEmpty) {
          _generalNewsStartBoardNumber =
              _generalNews.reversed.first.boardNumber!;
        }
        _generalNews.addAll(await _dataSource.fetchNews(
            'generalNews', _generalNewsStartBoardNumber));
        break;
      case '장학안내':
        if (_scholarshipNews.isNotEmpty) {
          _scholarshipNewsStartBoardNumber =
              _scholarshipNews.reversed.first.boardNumber!;
        }
        _scholarshipNews.addAll(await _dataSource.fetchNews(
            'scholarshipNews', _scholarshipNewsStartBoardNumber));
        break;
      case '행사안내':
        if (_eventNews.isNotEmpty) {
          _eventNewsStartBoardNumber = _eventNews.reversed.first.boardNumber!;
        }
        _eventNews.addAll(await _dataSource.fetchNews(
            'eventNews', _eventNewsStartBoardNumber));
        break;
      case '학사공지사항':
        if (_academicNews.isNotEmpty) {
          _academicNewsStartBoardNumber =
              _academicNews.reversed.first.boardNumber!;
        }
        _academicNews.addAll(await _dataSource.fetchNews(
            'academicNews', _academicNewsStartBoardNumber));
        break;
    }
    notifyListeners();
  }
}
