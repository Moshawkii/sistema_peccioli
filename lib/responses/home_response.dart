import 'package:sistema_peccioli_2/models/gallery_model.dart';
import 'package:sistema_peccioli_2/models/news_model.dart';
import 'package:sistema_peccioli_2/models/show_model.dart';

class HomeResponse {
  bool? success;
  List<News>? news;
  List<Shows>? shows;
  List<Gallery>? gallery;

  HomeResponse({
    this.success,
    this.news,
    this.shows,
    this.gallery,
  });

  HomeResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['news'] != null) {
      news = [];
      for (final newsItem in json['news']) {
        news?.add(News.fromJson(newsItem));
      }
    }

    if (json['events-shows'] != null) {
      shows = [];
      for (final showItem in json['events-shows']) {
        shows?.add(Shows.fromJson(showItem));
      }
    }

    if (json['galleries'] != null) {
      gallery = [];
      for (final galleryItem in json['galleries']) {
        gallery?.add(Gallery.fromJson(galleryItem));
      }
    }
  }
}
