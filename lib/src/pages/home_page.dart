import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:wallpaper/src/pages/image_page.dart';
import 'package:wallpaper/src/pages/main_page.dart';
import 'image_page.dart';
import 'wallpaper_page.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  List<Widget> pageList = <Widget>[
    const WallPaperPage(),
    const MainPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: pageList[pageIndex],
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.pink,
            unselectedItemColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.cyan,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: (value){
              setState(() {
                pageIndex = value;
              });

            },
            currentIndex: pageIndex,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.format_paint), label: "Изображения"),
              BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Избранное")
            ]
        )
    );
  }
}
