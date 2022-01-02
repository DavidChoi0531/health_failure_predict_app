import 'package:flutter/material.dart';
import 'package:health_failure_app_f/providers/news_content_provider.dart';
import 'package:provider/provider.dart';

class NewsHeroView extends StatelessWidget {
  const NewsHeroView(BuildContext context, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = context.watch<NewsContentProvider>();
    return SizedBox(
      height: 600,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              data.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(
              data.thumbnailImgUrl,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(data.content),
          ),
        ],
      ),
    );
  }
}
