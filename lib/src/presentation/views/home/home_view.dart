import 'package:flutter/material.dart';

import 'package:app_wallpaper/src/data/models/wallpaper_model.dart';
import 'package:app_wallpaper/src/data/data_source/api/firebase_api.dart';

import 'widgets/wallpaper_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Future<List<WallpaperModel>> _wallpapersFuture;
  @override
  void initState() {
    super.initState();
    _wallpapersFuture = FirebaseApi().getWallpapers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FlutterPappers'),
        backgroundColor: Colors.grey.shade900,
        elevation: 1,
      ),
      body: FutureBuilder(
        future: _wallpapersFuture,
        builder: (_, AsyncSnapshot<List<WallpaperModel>> snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;

            return LayoutBuilder(
              builder: (_, constraints) {
                final height = constraints.maxHeight;
                final width = constraints.maxWidth;
                final itemHeight = height * 0.50;
                final spacing = width * 0.05;

                return OverflowBox(
                  minHeight: constraints.minHeight,
                  minWidth: constraints.minWidth,
                  maxHeight: (height * 2) * 0.5,
                  maxWidth: width,
                  child: GridView.builder(
                    itemCount: data.length,
                    padding: EdgeInsets.only(bottom: itemHeight * 0.5),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: spacing,
                      crossAxisSpacing: spacing,
                      mainAxisExtent: height * 0.50,
                    ),
                    itemBuilder: (_, int i) {
                      final WallpaperModel wallpaper = data[i];

                      final bool isOdd = i.isOdd;
                      double yOffset = 10.0 * i;
                      if (yOffset > 50) yOffset = 50;

                      return Transform.translate(
                        offset: Offset(0, isOdd ? yOffset : 0),
                        child: WallpaperWidget(wallpaper: wallpaper),
                      );
                    },
                  ),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator.adaptive());
        },
      ),
    );
  }
}
