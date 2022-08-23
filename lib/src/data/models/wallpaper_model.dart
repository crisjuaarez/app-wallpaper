import 'package:app_wallpaper/src/domain/entities/wallpaper.dart';

class WallpaperModel extends Wallpaper {
  const WallpaperModel({
    required super.urlImage,
    required super.title,
  });

  factory WallpaperModel.fromMap(Map<String, dynamic> map) {
    return WallpaperModel(
      urlImage: map['urlImage'],
      title: map['title'],
    );
  }
}
