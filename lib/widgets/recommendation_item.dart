import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_news_app/api/NewsResponse.dart';
import 'package:intl/intl.dart';

import '../models/news_item.dart';
import '../screens/home_screens/details_screen.dart';

class RecommendationItem extends StatelessWidget {
  final Articles newsItem;
  const RecommendationItem({required this.newsItem});

  String formatDateNews(Articles article) {
    DateFormat input = DateFormat(article.publishedAt);
    DateFormat output = DateFormat('hh:mm a');

    DateTime inputDate = input.parse(article.publishedAt ?? "");
    String outputDate = output.format(inputDate);
    return outputDate;
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) => DetailsScreen(
                    newsItem: newsItem,
                  )));
        },

        child: Container(
          padding: const EdgeInsets.all(0),

          child: Row(
            children: [
              if (newsItem.urlToImage != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),

                  child: Image.network(
                    newsItem.urlToImage??"",
                    width: 130,
                    height: 140,
                    fit: BoxFit.cover,
                  ),
                ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (newsItem.urlToImage != null)
                      Text(
                      newsItem.author??"",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    if (newsItem.urlToImage != null)

                      Text(
                      newsItem.title??"",
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children:  [
                        if (newsItem.urlToImage != null)

                          CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.red,
                          child: Text(newsItem.source?.name??"",style: TextStyle(color: Colors.white,fontSize: 12),),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        if (newsItem.urlToImage != null)

                          Text(
                          newsItem.source?.name??"",
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          formatDateNews(newsItem),
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
