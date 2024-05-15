class News {
  final int nttId;
  final int boardNumber;
  final String title;
  final String contentURL;
  final String content;
  // final String contentImage;
  // final String departName;
  // final String registrationDate;
  final String newCheck;

  const News({
    required this.nttId,
    required this.boardNumber,
    required this.title,
    required this.contentURL,
    required this.content,
    // required this.contentImage,
    // required this.departName,
    // required this.registrationDate,
    required this.newCheck,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        "nttId": int nttId,
        "boardNumber": int boardNumber,
        "title": String title,
        "contentURL": String contentURL,
        "content": String content,
        // "contentImage": String contentImage,
        // "departName": String departName,
        // "registrationDate": String registrationDate,
        "newCheck": String newCheck,
      } =>
        News(
          nttId: nttId,
          boardNumber: boardNumber,
          title: title,
          contentURL: contentURL,
          content: content,
          // contentImage: contentImage,
          // departName: departName,
          // registrationDate: registrationDate,
          newCheck: newCheck,
        ),
      _ => throw const FormatException('Failed to load news.'),
    };
  }
}
