import 'package:flutter/material.dart';
import 'package:fluttermovieapp/common/sceenutils/sceenutils.dart';
import 'package:fluttermovieapp/presentation/journeys/home/home_screen.dart';
import 'package:fluttermovieapp/presentation/themes/theme-text.dart';
import 'package:fluttermovieapp/presentation/themes/theme_color.dart';

class MovieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: ThemeData(
        primaryColor: AppColor.vulcan,
        scaffoldBackgroundColor: AppColor.vulcan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: ThemeText.getTextTheme(),
        appBarTheme: const AppBarTheme(elevation: 0),
      ),
      home: HomeScreen(),
    );
  }
}