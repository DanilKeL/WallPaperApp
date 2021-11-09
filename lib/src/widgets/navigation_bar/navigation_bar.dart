import 'package:flutter/material.dart';
import 'tab_model.dart';

const Map<TabItem, TabModel> tabs = {
  TabItem.Home: TabModel(name: "Home", icon: Icons.home),
  TabItem.WallPaper: TabModel(name: "WallPaper", icon: Icons.format_paint),
};

class NavigationBar extends StatelessWidget {
  const NavigationBar({Key? key, required this.currentTab, required this.onSelectTab})
      : super(key: key);

  final TabItem currentTab;

  final ValueChanged<TabItem> onSelectTab;


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        selectedItemColor: Colors.pinkAccent,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.cyan,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentTab.index,
        iconSize: 30,
        items: [
          _buildItem(TabItem.Home),
          _buildItem(TabItem.WallPaper),
        ],
        onTap: (index) => onSelectTab(TabItem.values[index]));
  }

  BottomNavigationBarItem _buildItem(TabItem item) {
    return BottomNavigationBarItem(
      icon: Icon(
        _iconTabMatching(item),
      ),
      label: tabs[item]!.name,
    );
  }

  IconData _iconTabMatching(TabItem item) => tabs[item]!.icon;
}
