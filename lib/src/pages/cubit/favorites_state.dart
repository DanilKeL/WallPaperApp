part of 'favorites_cubit.dart';

@immutable
abstract class FavoritesState {}

class FavoritesInitial extends FavoritesState {}

class FavoritesLoadedState extends FavoritesState{
  List<dynamic> photos;
  FavoritesLoadedState(this.photos);
}

class FavoritesErrorState extends FavoritesState{
  String errorMessage;

  FavoritesErrorState(this.errorMessage);
}