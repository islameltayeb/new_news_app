import 'package:flutter/foundation.dart';

class NewsItem {
  final int id;
  final String title;
  final String description;
  final String imgUrl;
  final String imgAuthor;
  final String category;
  final String author;
  final String time;

  NewsItem({
    required this.id,
    required this.title,
    required this.description,
    required this.imgUrl,
    required this.imgAuthor,
    required this.category,
    required this.author,
    this.time = '8 minutes ago',
  });

}
class newsN extends ChangeNotifier{
  List<NewsItem> news = [
    NewsItem(
      id: 1,
      title: 'THere’s How to Find the Original Bitcoin Manifesto in Your Mac',
      description: 'This is far greater than mere ethics violations; it\'s '
          'about the perceived legitimacy of the Supreme Court,'
          '\" one former conservative federal judge said."',
      imgUrl: 'assets/images/sportcategory.jpg',
      imgAuthor: 'assets/images/cnn.png',
      category: 'Sports',
      author: 'BBC',
    ),
    NewsItem(
      id: 2,
      title: 'Two British-Israeli women killed in West Bank shooting - BBC',
      description: 'Speaking in his first interview since the failure of Silicon Valley Bank,'
          ' JPMorgan Chase CEO Jamie Dimon said that while the banking system is strong and sou...\n \n'
          'Speaking in his first interview since the failure of Silicon Valley Bank,'
          'Speaking in his first interview since the failure of Silicon Valley Bank,'
          'Speaking in his first interview since the failure of Silicon Valley Bank,'
          'Speaking in his first interview since the failure of Silicon Valley Bank,'
          'Speaking in his first interview since the failure of Silicon Valley Bank,\n'
          'Speaking in his first interview since the failure of Silicon Valley Bank,'
          ' JPMorgan Chase CEO Jamie Dimon said that while the banking system is strong and sou...\n \n',
      imgUrl: 'assets/images/technologycategory.jpg',
      imgAuthor: 'assets/images/cnn.png',
      category: 'Social',
      author: 'BBC',
    ),
    NewsItem(
      id: 3,
      title: 'WWE Apologizes For Showing Auschwitz Footage During WrestleMania Promo - TMZ',
      description: 'Speaking in his first interview since the failure of Silicon Valley Bank,'
          ' JPMorgan Chase CEO Jamie Dimon said that while the banking system is strong and sou...\n \n'
          'Speaking in his first interview since the failure of Silicon Valley Bank,'
          'Speaking in his first interview since the failure of Silicon Valley Bank,'
          'Speaking in his first interview since the failure of Silicon Valley Bank,'
          'Speaking in his first interview since the failure of Silicon Valley Bank,'
          'Speaking in his first interview since the failure of Silicon Valley Bank,\n'
          'Speaking in his first interview since the failure of Silicon Valley Bank,'
          ' JPMorgan Chase CEO Jamie Dimon said that while the banking system is strong and sou...\n \n',    imgUrl: 'assets/images/digital-marketing-category.jpg',
      category: 'Digital Marketing',
      imgAuthor: 'assets/images/cnn.png',
      author: 'National',
    ),
    NewsItem(
      id: 4,
      title: 'Another weight on the scale\' towards recession: Dimon on recent banking turmoil - CNN',
      description: 'Speaking in his first interview since the failure of Silicon Valley Bank,'
          ' JPMorgan Chase CEO Jamie Dimon said that while the banking system is strong and sou...\n \n'
          'Speaking in his first interview since the failure of Silicon Valley Bank,'
          'Speaking in his first interview since the failure of Silicon Valley Bank,'
          'Speaking in his first interview since the failure of Silicon Valley Bank,'
          'Speaking in his first interview since the failure of Silicon Valley Bank,'
          'Speaking in his first interview since the failure of Silicon Valley Bank,\n'
          'Speaking in his first interview since the failure of Silicon Valley Bank,'
          ' JPMorgan Chase CEO Jamie Dimon said that while the banking system is strong and sou...\n \n',

      imgUrl: 'assets/images/sciencecategory.jpg',
      imgAuthor: 'assets/images/cnn.png',
      category: 'Science',
      author: 'CNN',
    ),
  ];

}


