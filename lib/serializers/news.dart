class News {
  String title = '';
  String url = '';
  String by = '';

  News({this.title, this.url, this.by});

  factory News.fromJson(Map<String, dynamic> jsonMap) {
    return News(
      title: jsonMap['title'] ?? 'No Title Found',
      url: jsonMap['url'] ?? 'http://www.google.com',
      by: jsonMap['by'] ?? 'Author Not known',
    );
  }
}
