
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/data/api/model/articles_response/article_response.dart';
import 'package:news_app/data/api/model/sources_response/source_response.dart';
class ApiManager {
  static const String _baseUrl = 'newsapi.org';
  static  const String _apiKey = '340bdae8499143f299cb22d0c68baa04';
  static  const String sourcesEndPoint = '/v2/top-headlines/sources';
  static  const String articlesEndPoint = '/v2/everything';




  static Future<SourceResponse> getSources(String categoryId)async{
    Uri url = Uri.https(_baseUrl,'/v2/top-headlines/sources',{
      'apiKey':_apiKey,
      'category':categoryId,
    });
  var response = await http.get(url);
  // String bodyString = response.body;
   var json =  jsonDecode(response.body);
   SourceResponse  sourceResponse = SourceResponse.fromJson(json);
   return sourceResponse;
  }




  static Future<ArticleResponse> getArticles(String sourceId)async{
    Uri url = Uri.https(_baseUrl,articlesEndPoint,{
      'apiKey':_apiKey,
      'category':sourceId,
    });
     http.Response serverResponse = await  http.get(url);
     Map<String ,dynamic> json = jsonDecode(serverResponse.body);
   ArticleResponse  articleResponse = ArticleResponse.fromJson(json);
   return articleResponse;
  }

}