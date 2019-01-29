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
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Counter'),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'You have pushed the button this many times:',
          ),
          Observer(
              builder: (_) => Text(
                '${_hacker_news.value}',
                style: const TextStyle(fontSize: 20),
              )),
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: _hacker_news.increment,
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    ),
  );
}
