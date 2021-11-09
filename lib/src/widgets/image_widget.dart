import 'package:flutter/material.dart';
import '../pages/cubit/wallpaper_cubit.dart';
import '../models/image.dart';



Widget ImageWidget(ImageClass item, BuildContext context, WallpaperLoadedState state) {
  final double height = MediaQuery.of(context).size.height;
  final double width = MediaQuery.of(context).size.width;
  return Card(
    elevation: 6,
    margin: const EdgeInsets.only(bottom: 15.0),
    child: Padding(
      padding: const EdgeInsets.only(top: 2, bottom: 8, left: 8, right: 8),
      child: Container(
        width: 200,
        height: 350,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(item.imageLarge)
          )
        ),
      )
    ),
  );
}