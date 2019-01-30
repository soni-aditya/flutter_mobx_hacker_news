import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_test/models/hacker_news.dart';
import 'package:flutter_mobx_test/serializers/news.dart';
import 'package:url_launcher/url_launcher.dart';

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
//        body: Container(
//          child: Observer(
//              builder: (_) => ((_hacker_news.news != null) &&
//                      (_hacker_news.news.isNotEmpty))
//                  ? ListView.builder(
//                      itemCount: _hacker_news.news.length,
//                      itemBuilder: (_, index) {
//                        final newsAritcle = _hacker_news.news[index];
//                        return _makeArticleContainer(newsAritcle);
//                      },
//                    )
//                  : Center(
//                      child: CircularProgressIndicator(),
//                    )),
//        ),
        body: Observer(
          builder: (_) => RefreshIndicator(
                onRefresh: () async {
                  await Future.delayed(Duration(seconds: 1));
                  _hacker_news.increaseNewsLimit();
                },
                child: Container(
                  child: Observer(
                      builder: (_) => ((_hacker_news.news != null) &&
                              (_hacker_news.news.isNotEmpty))
                          ? ListView.builder(
                              itemCount: _hacker_news.news.length,
                              itemBuilder: (_, index) {
                                final newsAritcle = _hacker_news.news[index];
                                return _makeArticleContainer(newsAritcle);
                              },
                            )
                          : Center(
                              child: CircularProgressIndicator(),
                            )),
                ),
              ),
        ),
      );

  Widget _makeArticleContainer(News newsArticle) {
    return Padding(
      key: Key(newsArticle.title),
      padding: const EdgeInsets.all(16.0),
      child: ExpansionTile(
        title: Text(
          newsArticle.title,
          style: TextStyle(fontSize: 24.0),
        ),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text("${newsArticle.by} comments"),
              IconButton(
                onPressed: () async {
                  // TODO : Launch URL
                  if (await canLaunch(newsArticle.url)) {
                    launch(newsArticle.url);
                  }
                },
                icon: Icon(Icons.launch),
              )
            ],
          ),
        ],
      ),
    );
  }
}
