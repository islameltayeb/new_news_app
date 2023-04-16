import 'package:flutter/material.dart';
import 'package:new_news_app/provider/provider.dart';
import 'package:new_news_app/screens/home_screens/home.dart';
import 'package:new_news_app/save_screen/saved.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create:(context) => SavedProvider(),
      builder: (context, child) =>const MaterialApp(
        title: 'News App',
        debugShowCheckedModeBanner: false,
        home:Home(),
      ) ,
    ) ;
  }
}

