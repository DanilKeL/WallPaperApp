import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wallpaper/src/models/image.dart';
import 'package:wallpaper/src/requests/requests.dart';
import '../../utils/secure_storage.dart';
import 'package:flutter/material.dart';
import '../favorite_image_page.dart';
import '../image_page.dart';
part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());


  Future <List<ImageClass>> getFavorites() async{
    List <String> listOfFavoritesIds = await getListOfFavoritesIDs();
    List <ImageClass> listOfFavorites = [];
    for (int i = 0; i < listOfFavoritesIds.length; i++){
      listOfFavorites.add(await getPhoto(listOfFavoritesIds[i]));
    }
    return listOfFavorites;
  }

  Future <List<String>> getListOfFavoritesIDs() async{
    List <String> listFavorites = [];
    String photoID = "";
    String? favoritesIDs = await UserSecureStorage.getFavoriteFromStorage();
    for (int i = 0; i < favoritesIDs!.length; i++){
      if (favoritesIDs[i] != " " && i != favoritesIDs.length - 1){
        photoID += favoritesIDs[i];
        print(photoID);
      }
      else {
        if(i == favoritesIDs.length - 1){
          photoID += favoritesIDs[i];
        }
        listFavorites.add(photoID);

        photoID = "";
        continue;
      }
    }
    for (int i = 0; i < listFavorites.length; i++) {
      if(listFavorites[i] == ""){
        listFavorites.removeAt(i);
      }
      listFavorites.remove("");
    }
    print(listFavorites);
    return listFavorites;
  }

  Future <void> loadFavorites() async{
    emit(FavoritesLoadedState(await getFavorites()));
  }

  Future<void> loadImage(
      ImageClass image,
      BuildContext context) async {
    Navigator.push(context,
        MaterialPageRoute(
            builder: (context) =>  FavoriteImagePage(image: image,)));
  }

}


