import 'dart:convert';

import 'package:flutter_mobx_test/serializers/news.dart';
import 'package:flutter_mobx_test/serializers/news_list.dart';
import 'package:flutter_mobx_test/utils/constants.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

part 'hacker_news.g.dart';

class HackerNews = HackerNewsBase with _$HackerNews;

abstract class HackerNewsBase implements Store {
  @observable
  List newsList = [];

  @observable
  List<News> news = [];

  @observable
  int newsLimit = 4;

  @action
  increaseNewsLimit() {
    newsLimit = newsLimit + 4;
    getNewsList();
  }

  @action
  getNewsList() {
    fetchNewsList().then((newsListObject) {
      newsList = newsListObject.topStoryIndexes;
      getNews(newsList, newsLimit).then((listOfArticles) {
        listOfArticles.forEach((newsArticle) {
          news.add(newsArticle);
        });
      });
    });
  }
}

Future<NewsList> fetchNewsList() async {
  final response = await http.get(Constants.newsListUrl);

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    var parsedJson = json.decode(response.body);
    print('News IDs List => ${parsedJson.toString()}');
    return NewsList.fromJson(parsedJson);
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

Future<List<News>> getNews(List newsIdList, int indexRange) async {
  List<News> listOfNews = [];
//  for (int index = 0; index < newsIdList.length; index++) {
  //Fetching only top 25 news for now
  for (int index = (indexRange - 4); index < indexRange; index++) {
    News news = await fetchNews(int.parse(newsIdList[index].toString()));
    listOfNews.add(news);
  }
  return listOfNews;
}

Future<News> fetchNews(int newsId) async {
  String url = Constants.newsUrl(newsId);
  print(url);
  final response = await http.get(url);

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    var parsedJson = json.decode(response.body);
    print('News ID DETAILS => ${parsedJson.toString()}');
    return News.fromJson(parsedJson);
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post for Id ${newsId}');
  }
}
