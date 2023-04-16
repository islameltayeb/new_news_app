import 'package:flutter/material.dart';
import 'package:new_news_app/api/NewsResponse.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';

class SavedItem extends StatefulWidget {
  Articles articles;
   SavedItem(this.articles);

  @override
  State<SavedItem> createState() => _SavedItemState();
}

class _SavedItemState extends State<SavedItem> {
  late SavedProvider provider;

  @override
  Widget build(BuildContext context) {
    provider=Provider.of(context, listen: false);
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              widget.articles.urlToImage??"",
              width: 130,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                 Text(
                  widget.articles.source?.name??"",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                 Text(
                  widget.articles.title??"",
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children:  [
                    CircleAvatar(
                      child: Text(widget.articles.source?.name??""),
                      backgroundColor: Colors.red,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      widget.articles.source?.name??"",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    // Text(
                    //   "6/10",
                    //   style: const TextStyle(
                    //     fontSize: 12,
                    //     color: Colors.grey,
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                provider.deleteNews(widget.articles);
              });

            },
            icon:Icon(Icons.delete,color: Colors.blueAccent,size: 35,)),
        ],
      ),
    );
  }
}
