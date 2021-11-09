import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../widgets/navigation_bar/navigation_bar.dart' as navigationBar;
import '../widgets/navigation_bar/tab_controller.dart' as controller;
import '../widgets/navigation_bar/tab_model.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {

  final _navigatorKeys = {
    TabItem.Home: GlobalKey<NavigatorState>(),
    TabItem.WallPaper: GlobalKey<NavigatorState>(),
  };

  var _currentTab = TabItem.Home;

  void _selectTab(TabItem tabItem) {
    setState(() => _currentTab = tabItem);
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: controller.TabController(
        controllerKey: _navigatorKeys[tabItem]!,
        tabItem: tabItem,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_currentTab != TabItem.Home) { _selectTab(TabItem.WallPaper); }
        else if (_currentTab == TabItem.WallPaper) { _selectTab(TabItem.Home); }
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.cyan,
        body: Stack(children: <Widget>[
          _buildOffstageNavigator(TabItem.Home),
          _buildOffstageNavigator(TabItem.WallPaper),
        ]),
        bottomNavigationBar: navigationBar.NavigationBar(
          currentTab: _currentTab,
          onSelectTab: _selectTab,
        ),
      ),
    );
  }
}
