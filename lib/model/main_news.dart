class MainNews {
  final int? nttId;
  final String? title;
  final String? departName;
  final String? registrationDate;
  final String? contentURL;

  const MainNews({
    required this.nttId,
    required this.title,
    required this.departName,
    required this.registrationDate,
    required this.contentURL,
  });

  factory MainNews.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        "nttId": int? nttId,
        "title": String? title,
        "departName": String? departName,
        "registrationDate": String? registrationDate,
        "contentURL": String? contentURL,
      } =>
        MainNews(
          nttId: nttId,
          title: title,
          departName: departName,
          registrationDate: registrationDate,
          contentURL: contentURL,
        ),
      _ => throw const FormatException('Failed to load main news.'),
    };
  }
}
