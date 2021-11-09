import 'package:flutter/material.dart';
import 'package:wallpaper/src/pages/main_page.dart';
import 'package:wallpaper/src/pages/settings_page.dart';
import 'package:wallpaper/src/pages/wallpaper_page.dart';

import 'tab_model.dart';

class TabController extends StatelessWidget {
  TabController({required this.controllerKey, required this.tabItem});
  final GlobalKey<NavigatorState> controllerKey;
  final TabItem tabItem;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: controllerKey,
      onGenerateRoute: (routeSettings) {
        Widget selectedPage;
        if (tabItem == TabItem.Home) { selectedPage = MainPage(); print('Home_Page');}
        else if (tabItem == TabItem.WallPaper) { selectedPage = WallPaperPage(); print('WallPaper');}
        else  { selectedPage = SettingsPage(); print('Settings');}

        return MaterialPageRoute(
          builder: (context) => selectedPage,
        );
      },
    );
  }
}
