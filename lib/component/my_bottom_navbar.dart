import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyBottomNavBar({required this.onTabChange});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15, left: 10),
      child: GNav(
        onTabChange: onTabChange,
          activeColor: Colors.white,
          color: Colors.grey,
          tabBackgroundColor: Colors.blue.shade800,
          tabBorderRadius: 20,
          padding: EdgeInsets.symmetric(horizontal: 13, vertical: 8),
          iconSize: 27,
          tabs: const [
            GButton(
              icon: Icons.home,
              gap: 5,
              text: "Home",
            ),
            GButton(
              icon: Icons.sports_volleyball_outlined ,
              gap: 5,
              text: "Network",
            ),
            GButton(
              icon: Icons.bookmark_border,
              text: "Bookmark ",
            ),
            GButton(
              icon: Icons.person_outline_rounded,
              text: "Profile",
            ),
          ]),
    );
  }
}
