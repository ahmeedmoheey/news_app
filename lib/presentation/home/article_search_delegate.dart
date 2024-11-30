import  'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../data/api/model/articles_response/articles.dart';
import '../tabs/articles_list_widget/details_screen.dart';

class NewsSearchDelegate extends SearchDelegate {
  List<Article> articles = [];
  final String apiKey = '340bdae8499143f299cb22d0c68baa04';

  Future<void> fetchArticles(String query) async {
    if (query.isEmpty) return;

    final url =
        'https://newsapi.org/v2/everything?q=$query&apiKey=$apiKey&pageSize=20';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      articles = (data['articles'] as List)
          .map((article) => Article.fromJson(article))
          .toList();
    } else {
      throw Exception('Failed to fetch articles');
    }
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<void>(
      future: fetchArticles(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (articles.isEmpty) {
          return Center(child: Text('No articles found.'));
        }

        return ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) {
            final article = articles[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              elevation: 3,
              child: ListTile(
                leading: article.urlToImage != null
                    ? Image.network(
                  article.urlToImage!,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                )
                    : Icon(Icons.article, size: 50, color: Colors.grey),
                title: Text(
                  article.title ?? 'No Title',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  article.content ?? 'No Description',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ArticleDetailsScreen(
                        article: article,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<void>(
      future: fetchArticles(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (articles.isEmpty) {
          return Center(child: Text('No suggestions found.'));
        }

        final suggestions = articles
            .where((article) => article.title!
            .toLowerCase()
            .startsWith(query.toLowerCase()))
            .toList();

        return ListView.builder(
          itemCount: suggestions.length,
          itemBuilder: (context, index) {
            final article = suggestions[index];
            return ListTile(
              title: Text(
                article.title ?? 'No Title',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              onTap: () {
                query = article.title!;
                showResults(context);
              },
            );
          },
        );
      },
    );
  }
}
