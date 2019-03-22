import 'package:flutter/material.dart';

class ADTabBarWidget extends StatefulWidget {
  static const int BOTTOM_TAB = 0x01;
  static const int TOP_TAB = 0x02;
  final int type;

  final List<Widget> tabItems;

  final List<Widget> tabViews;

  final Color backgroundColor;

  final Color indicatorColor;

  final Widget title;

  final Widget drawer;

  final Widget floatingActionButton;

  final TarWidgetControl tarWidgetControl;

  final PageController packageController;

  final ValueChanged<int> onPageChanged;

  ADTabBarWidget(
      {Key key,
      this.tabItems,
      this.tabViews,
      this.backgroundColor,
      this.indicatorColor,
      this.title,
      this.drawer,
      this.floatingActionButton,
      this.tarWidgetControl,
      this.packageController,
      this.onPageChanged,
      this.type = BOTTOM_TAB})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _ADTabBarState(
      type,
      tabItems,
      tabViews,
      backgroundColor,
      indicatorColor,
      title,
      drawer,
      floatingActionButton,
      packageController);
}

///通过 with SingleTickerProviderStateMixin 实现动画效果。
class _ADTabBarState extends State<ADTabBarWidget>
    with SingleTickerProviderStateMixin {
  final int _type;
  final Color _backgroundColor;
  final Color _indicatorColor;
  final Widget _title;
  final PageController _pageController;
  final List<Widget> _tabItems;
  final List<Widget> _tabViews;

  TabController _tabController;
  Widget _drawer;
  Widget _floatingActionButton;

  _ADTabBarState(
      this._type,
      this._tabItems,
      this._tabViews,
      this._backgroundColor,
      this._indicatorColor,
      this._title,
      this._drawer,
      this._floatingActionButton,
      this._pageController)
      : super();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //初始化控制器
    _tabController =
        TabController(length: (_tabItems?.length ?? 0), vsync: this);
    print('type is $_type');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //销毁控制器
    _tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_type == ADTabBarWidget.TOP_TAB) {
      return Scaffold(
        //侧滑 drawer
        drawer: _drawer,
        floatingActionButton: _floatingActionButton,
        appBar: new AppBar(
          backgroundColor: _backgroundColor,
          title: _title,
          bottom: new TabBar(
            tabs: _tabItems,
          ),
        ),
      );
    } else {
      // TODO: implement build
      return Scaffold(
        drawer: _drawer,
        floatingActionButton: _floatingActionButton,
        appBar: AppBar(
          backgroundColor: _backgroundColor,
          title: _title,
        ),
        body: new PageView(
          controller: _pageController,

          ///每一个 tab 对应的页面主体，是一个Widget
          children: _tabViews,
          onPageChanged: (index) {
            ///页面触摸作用滑动回调，用于同步tab选中状态
            _tabController.animateTo(index);
          },
        ),
        bottomNavigationBar: new Material(
          color: _backgroundColor,
          child: new TabBar(
            tabs: _tabItems,
            controller: _tabController,
            labelColor: Colors.white,
            indicatorColor: _indicatorColor,
          ),
        ),
      );
    }
  }
}

class TarWidgetControl {
  List<Widget> footerButton = [];
}
