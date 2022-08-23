import 'package:flutter/material.dart';

import 'presentation/views/home/home_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlutterPapper',
      home: const HomeView(),
      theme: ThemeData.dark(),
    );
  }
}
