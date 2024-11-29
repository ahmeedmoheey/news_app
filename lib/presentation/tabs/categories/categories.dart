import 'package:flutter/material.dart';

import '../../../core/app_styles.dart';
import '../../../data_model/category_dm.dart';
import 'category_widget/category_widget.dart';

typedef OnCategoryClicked = void Function(CategoryDM);
class Categories extends StatelessWidget {
  Categories({super.key, required this.onCategoryClicked});
  OnCategoryClicked onCategoryClicked;

  List<CategoryDM> categoriesList = CategoryDM.getAllCategories();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pick your category\nof interest',
            style: AppStyles.homeCategory,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 25,
                crossAxisSpacing: 20,
              ),
              itemCount: categoriesList.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  onCategoryClicked(categoriesList[index]);
                },
                child: CategoryWidget(
                    categoryDM: categoriesList[index], index: index),
              ),
            ),
          )
        ],
      ),
    );
  }
}