import 'package:flutter/material.dart';
import 'package:health_failure_app_f/models/news_model.dart';
import 'package:health_failure_app_f/services/news_api.dart';

class NewsListProvider with ChangeNotifier {
  List<News> newsList = [];
  final NewsAPI _newsAPI = NewsAPI();

  NewsListProvider();

  Future<int> loadNewsList() async {
    try {
      newsList = await _newsAPI.loadNewsList();
      notifyListeners();
      return 1;
    } catch (e) {
      print(e);
      return 0;
    }
  }
}
