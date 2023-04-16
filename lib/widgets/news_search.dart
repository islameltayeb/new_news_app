import 'package:flutter/material.dart';
import 'package:new_news_app/screens/home_screens/details_screen.dart';
import 'package:new_news_app/screens/home_screens/recommendation.dart';
import 'package:new_news_app/widgets/recommendation_item.dart';

import '../api/NewsResponse.dart';
import '../api/api_manager.dart';



class NewsSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            showResults(context);
          },
          icon: Icon(
            Icons.search,
            size: 25,
          ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.clear,
          size: 25,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
   return FutureBuilder<NewsResponse>(
        future: ApiManager.getNewsSearch( query ??" "),
        builder:(context, snapShot){
          if(snapShot.hasError){
            return Text(snapShot.error.toString());
          }else if(snapShot.hasData){
            return ListView.builder(
                itemCount: snapShot.data!.articles!.length,
                itemBuilder: (context,index){
                  return RecommendationItem( newsItem: snapShot.data!.articles![index],);
                });
          }else{
            return  Center(child: CircularProgressIndicator());
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<NewsResponse>(
        future: ApiManager.getNews(),
        builder: (context, snapShot) {
          if (snapShot.hasError) {
            return Text(snapShot.error.toString());
          } else if (snapShot.hasData) {

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  itemCount: snapShot.data?.articles?.length,
                  itemBuilder: (context, index) {
                    return RecommendationItem( newsItem: snapShot.data!.articles![index],);
                  }),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
