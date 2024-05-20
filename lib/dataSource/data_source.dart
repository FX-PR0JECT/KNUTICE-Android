import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/news.dart';
import '../model/main_news.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DataSource {
  Future<List<News>> fetchNews(String endpoint) async {
    await dotenv.load();
    final response = await http
        .get(Uri.parse('${dotenv.get('SERVER_URL')}/$endpoint?size=10'));

    if (response.statusCode == 200) {
      String jsonData = utf8.decode(response.bodyBytes);
      var myJson = jsonDecode(jsonData)['data'] as List;
      final List<News> parsedResponse =
          myJson.map((dataJson) => News.fromJson(dataJson)).toList();
      return parsedResponse;
    } else {
      return List.empty(growable: true);
    }
  }

  Future<List<List<MainNews>>> fetchMainNews() async {
    await dotenv.load();
    final response =
        await http.get(Uri.parse('${dotenv.get('SERVER_URL')}/main'));

    if (response.statusCode == 200) {
      String jsonData = utf8.decode(response.bodyBytes);
      var myJson1 =
          jsonDecode(jsonData)['data']['generalNewsTopThreeTitle'] as List;
      var myJson2 =
          jsonDecode(jsonData)['data']['scholarshipNewsTopThreeTitle'] as List;
      var myJson3 =
          jsonDecode(jsonData)['data']['eventNewsTopThreeTitle'] as List;
      var myJson4 =
          jsonDecode(jsonData)['data']['academicNewsTopThreeTitle'] as List;

      final List<MainNews> parsedResponse1 =
          myJson1.map((dataJson) => MainNews.fromJson(dataJson)).toList();
      final List<MainNews> parsedResponse2 =
          myJson2.map((dataJson) => MainNews.fromJson(dataJson)).toList();
      final List<MainNews> parsedResponse3 =
          myJson3.map((dataJson) => MainNews.fromJson(dataJson)).toList();
      final List<MainNews> parsedResponse4 =
          myJson4.map((dataJson) => MainNews.fromJson(dataJson)).toList();

      final List<List<MainNews>> parsedResponseList = [
        parsedResponse1,
        parsedResponse2,
        parsedResponse3,
        parsedResponse4,
      ];
      return parsedResponseList;
    } else {
      final List<List<MainNews>> parsedResponseList =
          List.empty(growable: true);
      return parsedResponseList;
    }
  }
}
