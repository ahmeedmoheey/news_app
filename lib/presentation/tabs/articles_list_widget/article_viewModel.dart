import 'package:flutter/material.dart';

import '../../../data/api/api_manager/api_manager.dart';
import '../../../data/api/model/articles_response/articles.dart';

class ArticlesViewModel extends ChangeNotifier {
  List<Article>? articles;
  String? errorMessage;
  bool isLoading = false;

  void getNewsBySourceId(String sourceId) async {
    try {
      isLoading = true;
      notifyListeners();
      var response = await ApiManager.getArticles(sourceId); // 1hour
      isLoading = false;
      if (response.status == 'ok') {
        articles = response.articles;
      } else {
        errorMessage = response.message;
      }
      notifyListeners();
    } catch (e) {
      isLoading = false;
      errorMessage = 'Plz, Check internet connection';
      notifyListeners();
    }
  }
}
