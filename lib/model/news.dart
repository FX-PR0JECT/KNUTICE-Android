class News {
  final int? nttId;
  final int? boardNumber;
  final String? title;
  final String? contentURL;
  final String? contentImage;
  final String? departName;
  final String? registrationDate;

  const News({
    required this.nttId,
    required this.boardNumber,
    required this.title,
    required this.contentURL,
    required this.contentImage,
    required this.departName,
    required this.registrationDate,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        "nttId": int? nttId,
        "boardNumber": int? boardNumber,
        "title": String? title,
        "contentURL": String? contentURL,
        "contentImage": String? contentImage,
        "departName": String? departName,
        "registrationDate": String? registrationDate,
      } =>
        News(
          nttId: nttId,
          boardNumber: boardNumber,
          title: title,
          contentURL: contentURL,
          contentImage: contentImage,
          departName: departName,
          registrationDate: registrationDate,
        ),
      _ => throw const FormatException('Failed to load news.'),
    };
  }
}
