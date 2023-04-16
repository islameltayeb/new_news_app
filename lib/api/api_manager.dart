import 'dart:convert';

import 'NewsResponse.dart';
import 'package:http/http.dart' as http;
class ApiManager{
  static String baseUrl = "https://newsapi.org/v2";
  static String apiKey = "132de28b0fe546609a6e9ca8c097cda3";

  static Future<NewsResponse> getNews() async {
    var response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey"),);
    var json = jsonDecode(response.body);
    NewsResponse newsResponse = NewsResponse.fromJson(json);
    return newsResponse;
  }
  static Future<NewsResponse> getNewsCarsuel() async {
    var response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey&pageSize=5"),);
    var json = jsonDecode(response.body);
    NewsResponse newsResponse = NewsResponse.fromJson(json);
    return newsResponse;
  }  static Future<NewsResponse> getNewsSearch(String q) async {
    var response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?q=$q&apiKey=$apiKey"),);
    var json = jsonDecode(response.body);
    NewsResponse newsResponse = NewsResponse.fromJson(json);
    return newsResponse;
  }
}