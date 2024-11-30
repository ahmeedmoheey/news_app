import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/api/model/sources_response/source.dart';
import 'article_item_widget.dart';
import 'article_viewModel.dart';

class ArticlesListWidget extends StatefulWidget {
  ArticlesListWidget({super.key, required this.source});

  Source source;

  @override
  State<ArticlesListWidget> createState() => _ArticlesListWidgetState();
}

class _ArticlesListWidgetState extends State<ArticlesListWidget> {
  var viewModel = ArticlesViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewsBySourceId(widget.source.id ?? '');
  }

  @override
  void didUpdateWidget(covariant ArticlesListWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    viewModel.getNewsBySourceId(widget.source.id ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Consumer<ArticlesViewModel>(
        builder: (context, value, child) {
          if (viewModel.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (viewModel.errorMessage != null) {
            return Center(child: Text(viewModel.errorMessage!));
          }

          return Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) =>
                  ArticleItemWidget(article: viewModel.articles![index]),
              itemCount: viewModel.articles!.length,
            ),
          );
        },
      ),
    );
  }
}