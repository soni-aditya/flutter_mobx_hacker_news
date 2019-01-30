// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hacker_news.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

mixin _$HackerNews on HackerNewsBase, Store {
  final _$newsListAtom = Atom(name: 'HackerNewsBase.newsList');

  @override
  List get newsList {
    _$newsListAtom.reportObserved();
    return super.newsList;
  }

  @override
  set newsList(List value) {
    super.newsList = value;
    _$newsListAtom.reportChanged();
  }

  final _$newsAtom = Atom(name: 'HackerNewsBase.news');

  @override
  List<News> get news {
    _$newsAtom.reportObserved();
    return super.news;
  }

  @override
  set news(List<News> value) {
    super.news = value;
    _$newsAtom.reportChanged();
  }

  final _$newsLimitAtom = Atom(name: 'HackerNewsBase.newsLimit');

  @override
  int get newsLimit {
    _$newsLimitAtom.reportObserved();
    return super.newsLimit;
  }

  @override
  set newsLimit(int value) {
    super.newsLimit = value;
    _$newsLimitAtom.reportChanged();
  }

  final _$HackerNewsBaseActionController =
      ActionController(name: 'HackerNewsBase');

  @override
  dynamic increaseNewsLimit() {
    final _$prevDerivation = _$HackerNewsBaseActionController.startAction();
    try {
      return super.increaseNewsLimit();
    } finally {
      _$HackerNewsBaseActionController.endAction(_$prevDerivation);
    }
  }

  @override
  dynamic getNewsList() {
    final _$prevDerivation = _$HackerNewsBaseActionController.startAction();
    try {
      return super.getNewsList();
    } finally {
      _$HackerNewsBaseActionController.endAction(_$prevDerivation);
    }
  }
}
