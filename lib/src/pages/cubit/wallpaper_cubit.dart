import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:wallpaper/src/models/image.dart';
import '../../requests/requests.dart';
import '../image_page.dart';
import "../../utils/secure_storage.dart";
part 'wallpaper_state.dart';


class WallpaperCubit extends Cubit<WallpaperState> {
  WallpaperCubit() : super(WallpaperInitial());

  Future<void> loadImage(
      ImageClass image,
      BuildContext context) async {
    Navigator.push(context,
        MaterialPageRoute(
            builder: (context) =>  ImagePage(image: image,)));
  }

  Future<void> informInitial() async {
    print('Загрузка изображений');
  }

  Future<void> loadWallpaper(query) async {
    try{
      emit(WallpaperLoadedState(await searchPhotos(query))); // request news
      print('Новые изображения');
    }catch (e){
      emit(WallpaperErrorState('Ошибка при загрузке изображений'));
    }
  }

  Future<void> reloadWallpaper() async {
    emit(WallpaperInitial());
  }

  Future<void> reUserSecure() async {
    String? favorite = await UserSecureStorage.getFavoriteFromStorage();
    if (favorite == null){
      UserSecureStorage.setFavoriteInStorage("");
    }
  }
}
