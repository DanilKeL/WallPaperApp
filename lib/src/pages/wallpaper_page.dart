import 'package:flutter/material.dart';
import '../pages/cubit/wallpaper_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/image_widget.dart';

class WallPaperPage extends StatelessWidget {
   const WallPaperPage({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return BlocProvider(
       create: (_) => WallpaperCubit(),
       child: _WallpaperPage(),
     );
   }
}

class _WallpaperPage extends StatelessWidget {
  _WallpaperPage({Key? key}) : super(key: key);

  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WallpaperCubit, WallpaperState>(builder: (context, state){
      if (state is WallpaperInitial) {
        return Scaffold(
          appBar: AppBar(title: Text('Изображения'),),
          body: Container(
              child: Column(
              children: [
                SizedBox(height: 0,),
                TextField(
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(1),
                    borderSide: BorderSide(color: Colors.cyan),

                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(1),
                    borderSide: BorderSide(color: Colors.cyan),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(1),
                    borderSide: BorderSide(color: Colors.cyan),
                  ),
                  labelStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Exo 2',
                      color: Colors.black),
                  prefixIcon: Icon(Icons.search_sharp, size: 35, color: Colors.black),
                  hintText: "Введите категорию",
                  hintStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Exo 2',
                      color: Colors.black54),
                ),
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Exo 2',
                    color: Colors.black),
                keyboardType: TextInputType.text,
                controller: textController,
                onSubmitted: (_) => context.read<WallpaperCubit>().loadWallpaper(textController.text),
              )
              ])),

        );
      }

      if (state is WallpaperLoadedState) {
        print(state.photos);
        return Scaffold(
          appBar: AppBar(title: Text('Изображения'),),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 0,),
                TextField(
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(1),
                      borderSide: BorderSide(color: Colors.cyan),

                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(1),
                      borderSide: BorderSide(color: Colors.cyan),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(1),
                      borderSide: BorderSide(color: Colors.cyan),
                    ),
                    labelStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Exo 2',
                        color: Colors.black),
                    prefixIcon: Icon(Icons.search_sharp, size: 35, color: Colors.black),
                    hintText: "Введите категорию",
                    hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Exo 2',
                        color: Colors.black54),
                  ),
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Exo 2',
                      color: Colors.black),
                  keyboardType: TextInputType.text,
                  controller: textController,
                  onSubmitted: (_) => context.read<WallpaperCubit>().loadWallpaper(textController.text),
                ),
                ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: state.photos.length,
                    itemBuilder: (context, index) {
                return InkWell(
                    onTap: () => context.read<WallpaperCubit>().loadImage(state.photos[index], context),
                    child: ImageWidget(state.photos[index], context, state)
                );
                    }
                ),
              ],
            ),
          ),

        );
      }

      if (state is WallpaperErrorState) {
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
