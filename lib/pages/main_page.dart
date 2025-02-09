import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:gitcandies/pages/main_content_page.dart';
import 'package:gitcandies/pages/notifications_page.dart';
import 'package:gitcandies/pages/self_page.dart';
import 'package:gitcandies/pages/user_page.dart';


class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  final icons = [Icons.notifications, Icons.add, Icons.account_circle];
  final titles = ["Notifications", "测试1", "Mine"];

  List<Widget> pages = <Widget>[
    NotificationsPage(),
    SizedBox(),
    UserPage(),
  ];

  PageController _controller = PageController(initialPage: 1);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const ClampingScrollPhysics(),
      controller: _controller,
      children: <Widget>[
        SelfPage(controller: _controller),
        MainContentPage(controller: _controller),
      ],
    );
  }
}
