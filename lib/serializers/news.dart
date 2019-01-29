class News {
  String title = '';
  String url = '';
  String by = '';

  News({this.title, this.url, this.by});

  factory News.fromJson(Map<String, dynamic> jsonMap) {
    return News(
      title: jsonMap['title'],
      url: jsonMap['url'],
      by: jsonMap['by'],
    );
  }
}
