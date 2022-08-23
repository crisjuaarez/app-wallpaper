import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:app_wallpaper/src/domain/entities/wallpaper.dart';
import 'package:app_wallpaper/src/data/data_source/api/firebase_api.dart';
import 'package:app_wallpaper/src/presentation/widgets/circular_button.dart';
import 'package:app_wallpaper/src/presentation/widgets/my_image_network.dart';

class DetailView extends StatelessWidget {
  const DetailView({Key? key, required this.wallpaper}) : super(key: key);
  final Wallpaper wallpaper;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: size.width,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 24,
            horizontal: size.width * 0.05,
          ),
          child: FloatingActionButton.extended(
            elevation: 1.0,
            backgroundColor: CupertinoColors.systemRed,
            onPressed: () async =>
                await FirebaseApi().downloadWallpaper(wallpaper.urlImage),
            label: const Text(
              'Download',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Hero(
            tag: wallpaper.urlImage,
            child: MyNetworkImage(wallpaper.urlImage, height: size.height),
          ),
          Positioned(
            top: size.height * 0.05,
            left: size.width * 0.025,
            child: CircularIcon(
              icon: Icons.keyboard_arrow_left,
              onTap: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}
