class NewsList {
  List<int> topStoryIndexes = [];

  NewsList({this.topStoryIndexes});

  factory NewsList.fromJson(List<int> newsList) {
    return NewsList(topStoryIndexes: newsList);
  }
}

