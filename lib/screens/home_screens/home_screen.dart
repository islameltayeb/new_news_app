import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_news_app/api/NewsResponse.dart';
import 'package:new_news_app/screens/home_screens/details_screen.dart';
import 'package:new_news_app/widgets//custom_carsel_slider.dart';
import 'package:new_news_app/models/news_item.dart';

import '../../api/api_manager.dart';
import '../../widgets/recommendation_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Articles> newsList = [];
  final scrollController = ScrollController();
  bool showLoadNextPage = false;
  int pageNumber = 1;

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop) {
          showLoadNextPage = true;
          setState(() {});
        }
      }
    });
  }

  Widget build(BuildContext context) {
    if (showLoadNextPage) {
      ApiManager.getNews().then((NewsResponse) {
        newsList.addAll(NewsResponse.articles ?? []);
        showLoadNextPage = false;
        setState(() {});
      });
    }

      return FutureBuilder<NewsResponse>(
        future: ApiManager.getNews(),
        builder: (context, snapShot) {
          if (snapShot.hasError) {
            return Text(snapShot.error.toString());
          } else if (snapShot.hasData) {
            if (newsList.isEmpty) {
              newsList = snapShot.data?.articles ?? [];
            } else if (snapShot.data?.articles?[0].title == newsList[0].title) {
              scrollController.jumpTo(0);
              newsList = snapShot.data?.articles ?? [];
            }

            return SafeArea(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ///breaking news
                    Row(
                      children: [
                        const Text(
                          "Breaking News ",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "view all",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    ///carousel slider
                    Expanded(child: CostumeCarouselSlider()),
                    const SizedBox(
                      height: 0,
                    ),

                    ///recommendation
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Recommendation  ",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "view all",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),

                        ]),

                    Expanded(
                      child: ListView.builder(
                          controller: scrollController,
                          itemCount: newsList.length,
                          itemBuilder: (context, index) {
                            return RecommendationItem(
                              newsItem: newsList[index],
                            );
                          }),
                    )

                  ],
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
/*
SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      ///breaking news
                      Row(
                        children: [
                          const Text(
                            "Breaking News ",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "view all",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      ///carousel slider
                      //CostumeCarouselSlider(newsList:newsList),
                      const SizedBox(
                        height: 10,
                      ),

                      ///recommendation
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Recommendation  ",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "view all",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
 */

/*
ListView.builder(
                controller: scrollController,
                itemCount: newsList.length,
                itemBuilder: (context, index) {
                  return RecommendationItem(newsItem: newsList[index],);
                });
 */
