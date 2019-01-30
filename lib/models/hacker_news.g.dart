// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hacker_news.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

mixin _$HackerNews on HackerNewsBase, Store {
  final _$valueAtom = Atom(name: 'HackerNewsBase.value');

  @override
  int get value {
    _$valueAtom.reportObserved();
    return super.value;
  }

  @override
  set value(int value) {
    super.value = value;
    _$valueAtom.reportChanged();
  }

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

  final _$HackerNewsBaseActionController =
      ActionController(name: 'HackerNewsBase');

  @override
  void increment() {
    final _$prevDerivation = _$HackerNewsBaseActionController.startAction();
    try {
      return super.increment();
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
