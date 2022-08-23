import 'package:flutter/material.dart';

import 'package:app_wallpaper/src/domain/entities/wallpaper.dart';
import 'package:app_wallpaper/src/presentation/views/detail/detail_view.dart';
import 'package:app_wallpaper/src/presentation/widgets/my_image_network.dart';

class WallpaperWidget extends StatelessWidget {
  const WallpaperWidget({Key? key, required this.wallpaper}) : super(key: key);

  final Wallpaper wallpaper;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => DetailView(wallpaper: wallpaper),
        ),
      ),
      child: Hero(
        tag: wallpaper.urlImage,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: MyNetworkImage(
            wallpaper.urlImage,
            height: MediaQuery.of(context).size.height * 0.50,
          ),
        ),
      ),
    );
  }
}
