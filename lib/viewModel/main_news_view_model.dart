import 'package:flutter/material.dart';
import '../model/main_news.dart';
import '../dataSource/data_source.dart';

class MainNewsViewModel with ChangeNotifier {
  late final DataSource _dataSource;
  List<List<MainNews>> _newsTopThreeTitleList = List.empty(growable: true);
  List<MainNews> _generalNewsTopThreeTitle = List.empty(growable: true);
  List<MainNews> _scholarshipNewsTopThreeTitle = List.empty(growable: true);
  List<MainNews> _eventNewsTopThreeTitle = List.empty(growable: true);
  List<MainNews> _academicNewsTopThreeTitle = List.empty(growable: true);

  List<List<MainNews>> get newsTopThreeTitleList => _newsTopThreeTitleList;
  List<MainNews> get generalNewsTopThreeTitle => _generalNewsTopThreeTitle;
  List<MainNews> get scholarshipNewsTopThreeTitle =>
      _scholarshipNewsTopThreeTitle;
  List<MainNews> get eventNewsTopThreeTitle => _eventNewsTopThreeTitle;
  List<MainNews> get academicNewsTopThreeTitle => _academicNewsTopThreeTitle;

  MainNewsViewModel() {
    _dataSource = DataSource();
    _getNewsList();
  }

  Future<void> _getNewsList() async {
    _newsTopThreeTitleList = await _dataSource.fetchMainNews();
    _generalNewsTopThreeTitle = _newsTopThreeTitleList[0];
    _scholarshipNewsTopThreeTitle = _newsTopThreeTitleList[1];
    _eventNewsTopThreeTitle = _newsTopThreeTitleList[2];
    _academicNewsTopThreeTitle = _newsTopThreeTitleList[3];
    notifyListeners();
  }
}
