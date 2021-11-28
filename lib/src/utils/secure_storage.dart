import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../models/image.dart';
import 'dart:convert';


class UserSecureStorage {
  static const _storage = FlutterSecureStorage();

  static const _keyFavorite = 'favorite';

  static Future setFavoriteInStorage(String photoID) async =>
    await _storage.write(key: _keyFavorite, value: photoID);


  static Future<String?> getFavoriteFromStorage() async =>
    await _storage.read(key: _keyFavorite);

  static Future cleanStorage() async =>
      await _storage.deleteAll();

}