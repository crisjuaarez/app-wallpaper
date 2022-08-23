import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:app_wallpaper/src/data/models/wallpaper_model.dart';
import 'package:app_wallpaper/src/domain/repositories/wallpapers_repository.dart';
import 'package:url_launcher/url_launcher_string.dart';

class FirebaseApi implements WallpapersRespository {
  static const String _projectId = 'wallpaper-bb2da';
  static const String _url = 'https://firestore.googleapis.com/v1/projects/'
      '$_projectId'
      '/databases/(default)/documents/wallpapers';

  @override
  Future<List<WallpaperModel>> getWallpapers() async {
    final result = await http.get(Uri.parse(_url));
    final Map<String, dynamic> json = jsonDecode(result.body);
    final List docs = json['documents'];

    List<WallpaperModel> wallpapers = [];

    if (result.statusCode == 200) {
      for (var doc in docs) {
        final wallpaper = WallpaperModel(
          urlImage: doc['fields']['urlImage']['stringValue'],
          title: doc['fields']['title']['stringValue'],
        );
        wallpapers.add(wallpaper);
      }
    }
    return wallpapers;
  }

  @override
  Future<bool> downloadWallpaper(String url) async {
    final result = await launchUrlString(url);
    return result;
  }
}
