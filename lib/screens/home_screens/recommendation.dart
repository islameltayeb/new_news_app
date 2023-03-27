import 'package:flutter/material.dart';

class Recommendation extends StatelessWidget {
  const Recommendation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              "assets/images/sport.jpg",
              width: 130,
              height: 120,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                const Text(
                  "Sports ",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "What Training Do Vollyball Players Need ?",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,

                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    CircleAvatar(
                      radius: 12,
                      backgroundImage: AssetImage("assets/images/sportcate.jpg"),
                    ),
                    SizedBox(width: 5,),
                    Text(
                      "McKindeny",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(width: 5,),
                    Text(
                      "Feb 27,2023",
                      style: TextStyle(
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

    );
  }
}
