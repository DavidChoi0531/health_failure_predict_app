class News {
  String newsID;
  String thumbnailImgUrl;
  String title;
  String content;

  News({
    required this.newsID,
    required this.thumbnailImgUrl,
    required this.title,
    required this.content,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      newsID: json['newsID'],
      thumbnailImgUrl: json['thumbnailImgUrl'],
      title: json['title'],
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'newsID': newsID,
      'thumbnailImgUrl': thumbnailImgUrl,
      'title': title,
      'content': content,
    };
  }
}
