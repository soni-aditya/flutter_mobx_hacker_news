class Constants {
  static String newsListUrl =
      'https://hacker-news.firebaseio.com/v0/topstories.json';

  static String newsUrl(int newsId) {
    return 'https://hacker-news.firebaseio.com/v0/item/$newsId.json';
  }
}
