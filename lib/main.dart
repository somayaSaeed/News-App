import 'package:flutter/material.dart';
import 'package:news_app/ui/Board/board_screen.dart';
import 'package:news_app/ui/home_screen.dart';
import 'package:news_app/ui/news_screen/news_widget/news_details.dart';
import 'package:news_app/utils/theme.dart';


void main(){
  runApp(const NewsApp());
}
class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      initialRoute: SplashScreen.routeName ,
      routes: {
        NewsDetails.routeName: (context) => const NewsDetails(),
        HomeScreen.routeName: (context) => const HomeScreen(),
      },

      theme: MyThemeData.lightMode,
    );
  }
}
//221aa0419d1e4e5aa6ae49568a9175df