part of 'wallpaper_cubit.dart';

@immutable
abstract class WallpaperState {}

class WallpaperInitial extends WallpaperState {}

class WallpaperLoadedState extends WallpaperState{
  List<dynamic> photos;
  WallpaperLoadedState(this.photos);
}

class WallpaperErrorState extends WallpaperState{
  String errorMessage;

  WallpaperErrorState(this.errorMessage);
}

