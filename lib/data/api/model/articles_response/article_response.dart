import 'articles.dart';

class ArticleResponse {
  String? status;
  num? totalResults;
  List<Article>? articles;

  ArticleResponse({
      this.status, 
      this.totalResults,
      this.articles,});

  ArticleResponse.fromJson(dynamic json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles?.add(Article.fromJson(v));
      });
    }
  }

  String? get message => null;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['totalResults'] = totalResults;
    if (articles != null) {
      map['articles'] = articles?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}