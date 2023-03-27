import 'package:flutter/material.dart';
import 'package:new_news_app/component/my_bottom_navbar.dart';
import 'package:new_news_app/screens/home_screens/home_screen.dart';
import 'package:new_news_app/screens/home_screens/recommendation.dart';
import 'package:new_news_app/screens/network.dart';
import 'package:new_news_app/screens/profile.dart';
import 'package:new_news_app/screens/saved.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectIndex = 0;

  void navBar(int index) {
    setState(() {
      selectIndex = index;
    });
  }

  final List<Widget> pages = [
    const HomeScreen(),
    const Network(),
    const Saved(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navBar(index),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 70,
        elevation: 0,
        leading: Container(
          margin: EdgeInsets.only(left: 10),
          child: CircleAvatar(
            radius: 10,
            backgroundColor: Colors.grey[350],
            child: Icon(
              Icons.menu_outlined,
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          CircleAvatar(
            radius: 23,
            backgroundColor: Colors.grey[350],
            child: const Icon(
              Icons.search_outlined,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 23,
              backgroundColor: Colors.grey[350],
              child: const Icon(
                Icons.notification_add_outlined,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: pages[selectIndex],
    );
  }
}
