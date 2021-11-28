import 'package:flutter/material.dart';
import '../pages/cubit/favorites_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/image_widget.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FavoritesCubit(),
      child: _FavoritePage(),
    );
  }
}

class _FavoritePage extends StatelessWidget {
  _FavoritePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(builder: (context, state){
      if (state is FavoritesInitial) {
        context.read<FavoritesCubit>().getFavorites();
        context.read<FavoritesCubit>().loadFavorites();
        return Scaffold(
          appBar: AppBar(title: Text('Изображения'),),
          body: Container(
              child: Column(
                  children: const [
                    SizedBox(height: 0,),
                  ])),

        );
      }

      if (state is FavoritesLoadedState) {
        print(state.photos);
        return Scaffold(
          appBar: AppBar(title: Text('Изображения'),),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 0,),
                ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: state.photos.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () => {context.read<FavoritesCubit>().loadImage(state.photos[index], context),},
                          child: ImageWidget(state.photos[index], context, state)
                      );
                    }
                ),
              ],
            ),
          ),

        );
      }

      if (state is FavoritesErrorState) {
        print('Error');
        return Scaffold(
            appBar: AppBar(title: Text('ошибка'),)
        );
      }

      else return Container();

    });
    //


  }

}