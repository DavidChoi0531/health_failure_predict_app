import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:health_failure_app_f/services/news_api.dart';

class NewsViewModel {
  NewsAPI newsAPI = NewsAPI();

  Future<QuerySnapshot<Map<String, dynamic>>> loadNewsSliderData() {
    return newsAPI.loadNewsSliderList();
  }

  // Future<List<Map<String, dynamic>>> loadNewsData() async {
  //   return await newsAPI.loadNewsList();
  // }
}
