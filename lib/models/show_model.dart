class Shows {
  final int? id;
  final String? title;
  final String? photo;
  final int? isEvent;
  final String? shortDesc;
  final String? period;

  List<String> get calendarTitle => period?.split('/') ?? [];

  Shows({
    required this.id,
    required this.title,
    required this.photo,
    required this.isEvent,
    required this.shortDesc,
    required this.period,
  });

  factory Shows.fromJson(Map<String, dynamic> json) {
    return Shows(
      id: json['id'],
      title: json['title'],
      photo: json['photo'],
      isEvent: int.parse(json['isEvent']?.toString() ?? '0'),
      shortDesc: json['shortDesc'],
      period: json['period'],
    );
  }
}
