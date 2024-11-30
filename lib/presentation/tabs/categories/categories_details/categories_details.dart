import 'package:flutter/material.dart';
import 'package:news_app/data_model/category_DM.dart';
import 'package:news_app/presentation/tabs/categories/categories_details/widgets/category_details_viewModal.dart';
import 'package:news_app/presentation/tabs/categories/categories_details/widgets/sources_tab_widget/sources_tab_widget.dart';
import 'package:provider/provider.dart';


class CategoryDetails extends StatefulWidget {
  CategoryDetails({super.key, required this.categoryDM});

  CategoryDM categoryDM;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  var viewModel = CategoryDetailsViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSourcesByCategoryId(widget.categoryDM.id);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: viewModel,
        child: Consumer<CategoryDetailsViewModel>(
          builder: (context, value, child) {
            if (viewModel.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (viewModel.errorMessage != null) {
              return Center(
                child: Text(viewModel.errorMessage!),
              );
            }
            return SourcesTabWidget(sources: viewModel.sources!);
          },
        ));
  }
}