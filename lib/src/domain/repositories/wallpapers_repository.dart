import 'package:app_wallpaper/src/data/models/wallpaper_model.dart';

abstract class WallpapersRespository {
  Future<List<WallpaperModel>> getWallpapers();
  Future<bool> downloadWallpaper(String url);
}
