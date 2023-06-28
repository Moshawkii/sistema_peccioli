class News {
  final int? newsid;
  final String? title;
  final String? photo;
  final String? date;
  final String? description;
  final String? categoryidfk;
  final int? languageidfk;

  News({
    required this.newsid,
    required this.title,
    required this.photo,
    required this.date,
    required this.description,
    required this.categoryidfk,
    required this.languageidfk,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      newsid: json['newsid'],
      title: json['title'],
      photo: json['photo'],
      date: json['date'],
      description: json['description'],
      categoryidfk: json['categoryidfk'],
      languageidfk: json['languageidfk'],
    );
  }
}
