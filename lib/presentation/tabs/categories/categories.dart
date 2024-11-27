import 'package:flutter/material.dart';
import 'package:news_app/core/app_styles.dart';

import '../../../data_model/category_dm.dart';
import 'category_widget/category_widget.dart';
class Categories extends StatelessWidget {
  Categories({super.key,});
  List<CategoryDM> categoriesList = CategoryDM.getAllCategories();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          Text(
            'Pick your category\nof interest',style: AppStyles.homeCategory,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 25,
                crossAxisSpacing: 20,
              ),
              itemBuilder: (context, index) => CategoryWidget(
                    categoryDM: categoriesList[index], index: index),
              itemCount: categoriesList.length,
              ),
          ),
        ],
      ),
    );
  }
}