import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:health_failure_app_f/models/news_model.dart';

class NewsAPI {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Map<String, dynamic>>> loadNewsSliderList() {
    return firestore.collection('newsslider').get();
  }

  Future<List<News>> loadNewsList() async {
    List<News> result = [];
    var response = await firestore.collection('news').get();
    for (var element in response.docs) {
      var temp = element.data();
      temp['newsID'] = element.id;
      result.add(News.fromJson(temp));
    }
    return result;
  }

  Future<News?> loadNewsContent(String uid) async {
    try {
      var response = await firestore.collection('news').doc(uid).get();
      if (response.exists) {
        print(News.fromJson(response.data()!));
        return News.fromJson(response.data()!);
      }
    } catch (e) {
      print(e);
    }

    // News.fromJson(response.data())
  }
}
