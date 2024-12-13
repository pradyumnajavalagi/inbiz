class NewsArticle {
  final String? title;
  final String? description;
  final String? imageUrl;

  NewsArticle({this.title, this.description, this.imageUrl});

  factory NewsArticle.fromMap(Map<String, dynamic> map) {
    return NewsArticle(
      title: map['headline'] ?? '',
      description: map['summary'] ?? '',
      imageUrl: map['image'] ?? '',
    );
  }
}
