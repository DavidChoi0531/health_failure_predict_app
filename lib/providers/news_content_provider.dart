import 'package:flutter/material.dart';
import 'package:health_failure_app_f/models/news_model.dart';

class NewsContentProvider with ChangeNotifier {
  News _news;

  NewsContentProvider({required News news}) : _news = news;

  setNews(News news) {
    _news = news;
    notifyListeners();
  }

  String get newsID {
    return _news.newsID;
  }

  String get title {
    return _news.title;
  }

  String get content {
    return _news.content;
  }

  String get thumbnailImgUrl {
    return _news.thumbnailImgUrl;
  }
}
