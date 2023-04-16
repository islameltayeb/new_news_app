import 'package:flutter/cupertino.dart';
import 'package:new_news_app/api/NewsResponse.dart';

class SavedProvider extends ChangeNotifier{
List <Articles> listSavedNews=[];
void addNews(Articles articles){
  listSavedNews.add(articles);
  notifyListeners();
}
void deleteNews(Articles articles){
  listSavedNews.remove(articles);
  notifyListeners();
}
}