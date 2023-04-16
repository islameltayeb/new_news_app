import 'package:flutter/material.dart';
import 'package:new_news_app/api/NewsResponse.dart';
import 'package:new_news_app/models/news_item.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../provider/provider.dart';
import '../../save_screen/saved_item.dart';

class DetailsScreen extends StatefulWidget {
  final Articles newsItem;
   DetailsScreen({super.key, required this.newsItem});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
late SavedProvider provider=Provider.of(context);
bool isSelect=false;
  void addNews(Articles articles) {
    provider.addNews(articles);
    isSelect=true;
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                 toolbarHeight: 100,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                    ),
                  ),
                  leadingWidth: 60,
                  actions: [
                    InkWell(
                      onTap: () {},
                      child: CircleAvatar(
                        backgroundColor: Colors.grey.withOpacity(.5),
                        child: IconButton(
                          onPressed: () {
                            addNews(widget.newsItem);
                            SavedItem(widget.newsItem);
                          },
                          icon: Icon(isSelect?Icons.bookmark:Icons.bookmark_border),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.grey.withOpacity(.5),
                      child:  IconButton(
                        onPressed: () => addNews(widget.newsItem),
                        icon: Icon(Icons.data_saver_off_rounded),
                        color: Colors.white,
                      ),
                    ),
                  ],
                  backgroundColor: Colors.transparent,
                  expandedHeight: 350,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      children: [
                        Positioned.fill(
                          child: InkWell(
                            onTap: () {
                              _launchURL(Uri.parse(widget.newsItem.url??""));
                            },
                            child: Image.network(
                              widget.newsItem.urlToImage??"",
                              //height: MediaQuery.of(context).size.height * 0.9,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        Positioned(
                          bottom: 50.0,
                          left: 15.0,
                          right: 0.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(22),
                                    color: Colors.blue.shade600,
                                  ),
                                  child: Text(
                                    widget.newsItem.source?.name??"",
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  widget.newsItem.title??"",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Text(
                                widget.newsItem.publishedAt??"",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  pinned: true,
                  bottom: const PreferredSize(
                    preferredSize: Size.fromHeight(0),
                    child: SizedBox(
                      height: 20,
                      width: double.infinity,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
                          color: Colors.white,
                        ),
                      ),

                    ),
                  ),

                ),

                SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              child: Text(widget.newsItem.source?.name??""),
                              backgroundColor: Colors.red,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              widget.newsItem.source?.name??"",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Icon(
                              Icons.check_circle,
                              color: Colors.blue,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          widget.newsItem.description??"",
                          style: TextStyle(fontSize: 17, height: 2),
                        )
                      ],
                    ),
                  ),
                ),
                SliverPadding(padding: EdgeInsets.only(bottom:471),),
              ],

            ),
          ),
          Positioned(
              bottom: 0,
              child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*.3,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.center, colors: [Colors.white,Colors.white.withOpacity(0)]
                )
              ),
            ),
          ))
        ],
      ),
    );
  }

}
_launchURL(Uri url) async {
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}