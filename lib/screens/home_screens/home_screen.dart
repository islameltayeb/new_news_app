import 'package:flutter/material.dart';
import 'package:new_news_app/screens/home_screens/recommendation.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = PageController(viewportFraction: 0.8, keepPage: true);

    return Padding(
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

          ///category of news
          SizedBox(
              height: 200,
              child: ScrollSnapList(
                listController: controller,
                itemBuilder: (p0, p1) => Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(22),
                      child: Image.asset(
                        "assets/images/sportcate.jpg",
                        //height: 600,

                      ),
                    ),
                    Positioned(
                      top: 20,
                      left: 20,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          color: Colors.blue.shade600,
                        ),
                        child: const Text(
                          "Sports",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 74,
                      left: 20,
                      child: Row(
                        children: const [
                          Text(
                            "CNN Indonesia ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.check_circle,
                            color: Colors.blue,
                            size: 18,
                          ),
                          Text(
                            " . 6 hours ago ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Positioned(
                      //right: 20,
                      bottom: 18,
                      left: 20,
                      child: Text(
                        "Alexander wears modified \n helmet in road races",
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                itemCount: 5,
                itemSize: 310,
                onItemFocus: (p0) {},
                dynamicItemSize: true,


              ),),

          const SizedBox(
            height: 10,
          ),
          SmoothPageIndicator(
              controller: controller, // PageController
              count: 5,
              effect: ExpandingDotsEffect(
                  spacing: 3,
                  dotHeight: 15,
                  dotWidth: 10,
                  dotColor: Colors.grey.shade400), // your preferred effect
              onDotClicked: (index) {},

          ),
          const SizedBox(
            height: 10,
          ),

          ///recommendation
          Row(
            children: [
              const Text(
                "Recommendation  ",
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
          Expanded(
              child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return const Recommendation();
            },
          ))
        ],
      ),
    );
  }
}
