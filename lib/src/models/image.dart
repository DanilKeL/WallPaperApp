class ImageClass{
  var photographer;
  var photographerUrl;
  var imageOriginal;
  var imageLarge;
  var imageVeryLarge;
  var imageMedium;
  var imageSmall;
  var imagePortrait;
  var imageLandscape;
  var photoID;
  ImageClass({
    required this.photographer,
    required this.photographerUrl,
    required this.imageOriginal,
    required this.imageLarge,
    required this.imageVeryLarge,
    required this.imageMedium,
    required this.imageSmall,
    required this.imagePortrait,
    required this.imageLandscape,
    required this.photoID,
  });

  factory ImageClass.fromJson(Map<String, dynamic> json) {
    return ImageClass(
      photographer: json['photographer'],
      photographerUrl: json['photographer_url'],
      imageOriginal: json['src']['original'],
      imageLarge: json['src']['large'],
      imageVeryLarge: json['src']['large2x'],
      imageMedium: json['src']['medium'],
      imageSmall: json['src']['small'],
      imagePortrait: json['src']['portrait'],
      imageLandscape: json['src']['landscape'],
      photoID: json['id'],
    );
  }
}