import 'package:flutter/material.dart';
import 'package:new_news_app/api/NewsResponse.dart';
import 'package:new_news_app/models/news_item.dart';
import 'package:new_news_app/save_screen/saved_item.dart';
import 'package:new_news_app/widgets/recommendation_item.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';

class Saved extends StatefulWidget {

   Saved({Key? key}) : super(key: key);

  @override
  State<Saved> createState() => _SavedState();
}


class _SavedState extends State<Saved> {
   late SavedProvider provider=Provider.of(context, listen: false);
@override

  @override
  Widget build(BuildContext context) {
  Articles articles;
  List<Widget> l= provider.listSavedNews.cast<Widget>();

    return ListView.builder(
        itemCount: provider.listSavedNews.length,
        itemBuilder: (context, index) {
          return  SavedItem(provider.listSavedNews[index]);

        },);
  }}
