import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:health_failure_app_f/models/news_model.dart';
import 'package:health_failure_app_f/providers/news_content_provider.dart';
import 'package:health_failure_app_f/providers/news_list_provider.dart';
import 'package:provider/provider.dart';
import 'package:health_failure_app_f/view_models/news_view_model.dart';
import 'package:health_failure_app_f/views/news_hero_view.dart';

class NewsView extends StatefulWidget {
  const NewsView({Key? key}) : super(key: key);

  @override
  _NewsViewState createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  NewsViewModel newsViewModel = NewsViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(75),
        child: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Health Failure',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35,
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.black,
                ))
          ],
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          _buildNewsSlider(),
          const SizedBox(
            height: 20,
          ),
          _buildNews(),
        ],
      ),
    );
  }

  Widget _buildNewsSlider() {
    return FutureBuilder(
      future: newsViewModel.loadNewsSliderData(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('${snapshot.error}'),
          );
        }
        if (snapshot.hasData) {
          return CarouselSlider(
            items: snapshot.data!.docs.map((value) {
              Map<String, dynamic> data = value.data() as Map<String, dynamic>;
              return ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width - 100,
                  child: Image.asset(
                    data['thumbnailImgUrl'],
                    fit: BoxFit.fill,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 5.0,
                        ),
                      ]),
                ),
              );
            }).toList(),
            options: CarouselOptions(
              aspectRatio: 16 / 9,
              autoPlay: true,
              height: 150,
              autoPlayAnimationDuration: const Duration(seconds: 3),
            ),
          );
        }
        return const Center();
      },
    );
  }

  Widget _buildNews() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: Container(
        height: 1000,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, -2.0),
              blurRadius: 10,
            ),
          ],
        ),
        child: FutureBuilder(
          future: context.read<NewsListProvider>().loadNewsList(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('Error'),
              );
            }
            if (snapshot.hasData) {
              var data = context.read<NewsListProvider>().newsList;
              return GridView.builder(
                itemCount: data.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      context.read<NewsContentProvider>().setNews(data[index]);
                      showDialog(context: context, builder: buildDialog);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        child: Center(
                          child: Column(
                            children: [
                              Image.asset(
                                data[index].thumbnailImgUrl,
                                height: 130,
                                width: 200,
                                fit: BoxFit.cover,
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Center(
                                    child: Text(
                                      data[index].title,
                                      style: const TextStyle(
                                        fontSize: 15,
                                      ),
                                      overflow: TextOverflow.fade,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(2.0, 2.0),
                                blurRadius: 5.0,
                              ),
                            ]),
                      ),
                    ),
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  Widget buildDialog(BuildContext context) {
    return Dialog(
      child: NewsHeroView(context),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
