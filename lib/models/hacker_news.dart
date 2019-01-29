import 'package:mobx/mobx.dart';

part 'hacker_news.g.dart';

class HackerNews = HackerNewsBase with _$HackerNews;

abstract class HackerNewsBase implements Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}