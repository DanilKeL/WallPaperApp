import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../authorization.dart' as auth;
import '../models/image.dart' as image;


Future<List<dynamic>> searchPhotos(query) async {
  final body = {
    'query': query,
    'per_page': '50',
  };

  final Uri searchUrl = Uri.https('api.pexels.com', 'v1/search', body);

  final Map<String, String> headers = {
    'Authorization': auth.token
  };

  final http.Response searchPhotosResponse = await http.get(searchUrl, headers: headers);

  if (searchPhotosResponse.statusCode == 200) {

    List<dynamic> myList = List.filled(50, 0);

    var json = convert.jsonDecode(searchPhotosResponse.body);

    for(int i = 0; i<myList.length; i++){
      myList[i] = image.ImageClass.fromJson(json['photos'][i]);
    }

    print(myList);
    return myList;

  }

  else {
    throw Exception('Failed to get image response');
  }


}




Future <image.ImageClass> getPhoto(String ID) async {
  final Uri searchUrl = Uri.https('api.pexels.com', 'v1/photos/${int.parse(ID)}');

  final Map<String, String> headers = {
    'Authorization': auth.token
  };

  final http.Response searchPhotosResponse = await http.get(
      searchUrl, headers: headers);

  if (searchPhotosResponse.statusCode == 200) {
    var json = convert.jsonDecode(searchPhotosResponse.body);

    return image.ImageClass.fromJson(json);
  }

  else {
    throw Exception('Failed to get image response');
  }
}