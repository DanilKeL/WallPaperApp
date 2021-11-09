import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../requests/requests.dart';
part 'wallpaper_state.dart';

class WallpaperCubit extends Cubit<WallpaperState> {
  WallpaperCubit() : super(WallpaperInitial());

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

  Future<void> reloadNews() async {
    emit(WallpaperInitial());
  }
}
