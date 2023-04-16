import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:new_news_app/models/news_item.dart';
import 'package:new_news_app/screens/home_screens/details_screen.dart';

import '../../api/api_manager.dart';
import 'package:new_news_app/api/NewsResponse.dart';

class CostumeCarouselSlider extends StatefulWidget {
  @override
  State<CostumeCarouselSlider> createState() => _CostumeCarouselSliderState();
}

class _CostumeCarouselSliderState extends State<CostumeCarouselSlider> {
  List<Articles> newsList = [];
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override

  Widget build(BuildContext context) {
    //final newsN n=newsN();

    final List<Widget> imageSliders = newsList
        .map((item) => InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DetailsScreen(newsItem: item ,)));
      },
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(22.0)),
                    child: Stack(
                      children: <Widget>[
                        if (item.urlToImage != null)
                        Image.network(item.urlToImage ?? "assets/images/cnn.png",
                            fit: BoxFit.cover, width: 1000.0),
                        Positioned(
                          top: 20,
                          left: 20,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              color: Colors.blue.shade600,
                            ),
                            child: Text(
                              item.source?.name ?? "",
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: Text(
                                  '${item.author}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(200, 0, 0, 0),
                                      Color.fromARGB(0, 0, 0, 0)
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  ),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 20.0),
                                child: Text(
                                  item.title ?? "",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList();
    return FutureBuilder<NewsResponse>(
        future: ApiManager.getNewsCarsuel(),
        builder: (context, snapShot) {
          if (snapShot.hasError) {
            return Text(snapShot.error.toString());
          } else if (snapShot.hasData) {
            if (newsList.isEmpty) {
              newsList = snapShot.data?.articles ?? [];
            }

            return Column(children: [
              CarouselSlider(
                items: imageSliders,
                carouselController: _controller,
                options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 2.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: newsList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: _current == entry.key ? 25.0 : 12.0,
                      height: 12.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          borderRadius: _current == entry.key
                              ? BorderRadius.circular(8)
                              : null,
                          shape: _current == entry.key
                              ? BoxShape.rectangle
                              : BoxShape.circle,
                          color: _current == entry.key
                              ? Theme.of(context).primaryColor
                              : Colors.grey.withOpacity(0.4)),
                    ),
                  );
                }).toList(),
              ),
            ]);
          }else {
            return Center(child: CircularProgressIndicator());
          }
        }
        );
  }
}
