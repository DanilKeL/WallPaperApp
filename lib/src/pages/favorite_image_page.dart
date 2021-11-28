import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallpaper/src/models/image.dart';
import 'package:image_downloader/image_downloader.dart';
import '../utils/secure_storage.dart';

class FavoriteImagePage extends StatelessWidget {
  final ImageClass image;
  const FavoriteImagePage({Key? key, required this.image}) : super(key: key);


  Future <void> deleteFavorite(String photoID) async{
    print(photoID);
    String? favoriteIDs = await UserSecureStorage.getFavoriteFromStorage();
    print(favoriteIDs);
    favoriteIDs = favoriteIDs!.replaceAll(photoID, "");
    UserSecureStorage.setFavoriteInStorage(favoriteIDs);
    print(favoriteIDs);
  }

  Future <void> downloadImage(url) async{
    try {
      // Saved with this method.
      var imageId = await ImageDownloader.downloadImage(url, destination: AndroidDestinationType.directoryDownloads..subDirectory("flutter_image.png"));
      print("DOWNLOAD!");
      if (imageId == null) {
        print("ERRRRRROR");
        return;
      }

      // Below is a method of obtaining saved image information.
      var fileName = await ImageDownloader.findName(imageId);
      var path = await ImageDownloader.findPath(imageId);
      var size = await ImageDownloader.findByteSize(imageId);
      var mimeType = await ImageDownloader.findMimeType(imageId);
    } on PlatformException catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Настройки',)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 420,
            height: 215,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(image.imageLandscape)
                )
            ),
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
              const SizedBox(width: 10,),
              Text('Photographer: ${image.photographer}',

                  style: const TextStyle (
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  )
              ),
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
              const SizedBox(width: 10,),
              Expanded(
                child: Text('URL: ${image.photographerUrl}',

                    style: const TextStyle (
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    )
                ),
              ),
            ],
          ),
          const SizedBox(height: 20,),
          Row(
            children: [
              const SizedBox(width: 10,),
              FloatingActionButton(onPressed: () => downloadImage(image.imageOriginal),
                child: const Icon(Icons.get_app),
              ),
              const SizedBox(width: 15,),
              FloatingActionButton(onPressed: () => deleteFavorite("${image.photoID}"),
                  heroTag: "Next",
                  child: const Icon(Icons.delete)),
            ],
          )
        ],
      ),
    );
    //
  }
}