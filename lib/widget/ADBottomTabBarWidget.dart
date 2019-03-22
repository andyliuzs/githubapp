import 'package:flutter/material.dart';
import 'package:githubapp/pageview/TestTabBarPageFirst.dart';
import 'package:githubapp/pageview/TestTabBarPageSecond.dart';
import 'package:githubapp/pageview/TestTabBarPageThird.dart';

import 'ADTabBarWidget.dart';

class ADBottomTabBarWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BottomTabBarWidgetState();
}

class _BottomTabBarWidgetState extends State<ADBottomTabBarWidget> {
  final PageController pageController = new PageController();
  final List<String> tabStr = ["动态", "趋势", "我的"];

  _renderTab() {
    List<Widget> list = new List();
    for (int i = 0; i < tabStr.length; i++) {
      list.add(new FlatButton(
          onPressed: () {
            //pagecontroller通过屏幕的宽度跳转
            pageController.jumpTo(MediaQuery.of(context).size.width * i);
          },
          child: new Text(
            tabStr[i],
            maxLines: 1,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          )));
    }
    return list;
  }

  _renderPage() {
    return [
      new TestTabBarPageFirst(),
      new TestTabBarPageSecond(),
      new TestTabBarPageThird()
    ];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ADTabBarWidget(
      tabItems: _renderTab(),
      tabViews: _renderPage(),
      packageController: pageController,
      backgroundColor: Colors.blue,
      indicatorColor: Colors.white,
      title: new Text('test tabbar'),
    );
  }
}
