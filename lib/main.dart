import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:health_failure_app_f/models/news_model.dart';
import 'package:health_failure_app_f/providers/news_content_provider.dart';
import 'package:health_failure_app_f/providers/news_list_provider.dart';
import 'package:health_failure_app_f/providers/user_info_provider.dart';
import 'package:health_failure_app_f/view_models/predict_health_failure_view_model.dart';
import 'package:health_failure_app_f/views/news_hero_view.dart';
import 'package:health_failure_app_f/views/sign_in_view.dart';
import 'package:health_failure_app_f/views/tab_bar_controller.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserInfoProvider()),
        ChangeNotifierProvider(create: (_) => PredictHeathFailureViewModel()),
        ChangeNotifierProvider(create: (_) => NewsListProvider()),
        ChangeNotifierProvider(
            create: (_) => NewsContentProvider(
                news: News(
                    newsID: '', thumbnailImgUrl: '', title: '', content: ''))),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Data load Failed");
        } else if (snapshot.connectionState == ConnectionState.done) {
          return const MainView();
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) {
          return const TabBarController();
        },
        '/signIn': (context) {
          return const SignInView();
        },
      },
    );
  }
}
