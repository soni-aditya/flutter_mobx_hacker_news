import 'dart:convert';

import 'package:flutter_mobx_test/serializers/news_list.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

part 'hacker_news.g.dart';

class HackerNews = HackerNewsBase with _$HackerNews;

abstract class HackerNewsBase implements Store {
  @observable
  int value = 0;

  @observable
  List newsList = [];

  @action
  void increment() {
    value++;
  }

  @action
  getNewsList() {
    fetchNewsList().then((newsListObject) {
      newsList = newsListObject.topStoryIndexes;
    });
  }
}

Future<NewsList> fetchNewsList() async {
  final response =
      await http.get('https://hacker-news.firebaseio.com/v0/topstories.json');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    var  parsedJson = json.decode(response.body);
    print(parsedJson.toString());
    return NewsList.fromJson(parsedJson);
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}
