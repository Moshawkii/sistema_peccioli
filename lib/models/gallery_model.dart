
class Gallery {
  final int? galleryId;
  final String? name;
  final String? photo;
  final int? status;
  final String? creationDate;

  Gallery({
    required this.galleryId,
    required this.name,
    required this.photo,
    required this.status,
    required this.creationDate,
  });

  factory Gallery.fromJson(Map<String, dynamic> json) {
    return Gallery(
      galleryId: json['galleryid'],
      name: json['name'],
      photo: json['photo'],
      status: json['status'],
      creationDate: json['creation_date'],
    );
  }
}
