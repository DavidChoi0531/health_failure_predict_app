import 'package:flutter/material.dart';
import 'package:health_failure_app_f/views/description_view.dart';
import 'package:health_failure_app_f/views/news_view.dart';
import 'package:health_failure_app_f/views/settings_view.dart';
import 'package:health_failure_app_f/views/survey/poll_notification_view.dart';

class TabBarController extends StatefulWidget {
  const TabBarController({Key? key}) : super(key: key);

  @override
  _TabBarControllerState createState() => _TabBarControllerState();
}

class _TabBarControllerState extends State<TabBarController>
    with SingleTickerProviderStateMixin {
  late TabController _tabBarController;
  final List<Tab> _tabBarList = [
    const Tab(
      text: 'home',
      icon: Icon(Icons.home),
    ),
    const Tab(
      text: 'Poll',
      icon: Icon(Icons.create),
    ),
    const Tab(
      text: 'Description',
      icon: Icon(Icons.format_align_justify),
    ),
    const Tab(
      text: 'settings',
      icon: Icon(Icons.settings),
    ),
  ];
  final List<Widget> _tabBarViewList = [
    const NewsView(),
    const PollNotificationView(),
    const DescriptionView(),
    const SettingsView(),
  ];

  @override
  void initState() {
    super.initState();
    _tabBarController =
        TabController(length: _tabBarViewList.length, vsync: this);
  }

  @override
  void dispose() {
    _tabBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabBarController,
        children: _tabBarViewList,
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            border: Border.symmetric(horizontal: BorderSide(width: 1)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, -1.0),
                blurRadius: 10,
              ),
            ]),
        child: TabBar(
          labelColor: Colors.black,
          indicatorColor: Colors.green[900],
          controller: _tabBarController,
          tabs: _tabBarList,
        ),
      ),
    );
  }
}
