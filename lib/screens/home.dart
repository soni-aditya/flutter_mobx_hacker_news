import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_test/models/hacker_news.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  final _hacker_news = HackerNews();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _hacker_news.getNewsList();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Hacker News'),
        ),
        body: Observer(
          builder: (_) => Container(
                child: ((_hacker_news.news != null) &&
                        (_hacker_news.news.isNotEmpty))
                    ? ListView.builder(
                        itemCount: _hacker_news.news.length,
                        itemBuilder: (_, index) {
                          final newsListIndex =
                              _hacker_news.news[index].title ?? 'No Title';
                          return Text(
                            newsListIndex.toString(),
                          );
                        },
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      ),
              ),
        ),
      );
}
