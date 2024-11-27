import 'package:flutter/material.dart';
import 'package:news_app/core/app_styles.dart';
import 'package:news_app/data_model/category_dm.dart';

class CategoryWidget extends StatelessWidget {
   CategoryWidget({super.key,required this.categoryDM,required this.index});
  CategoryDM categoryDM ;
  int index ;
  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        color: categoryDM.bgColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          topLeft: Radius.circular(25),
          bottomLeft: Radius.circular(index.isEven? 25:0),
          bottomRight: Radius.circular(index.isEven ?0 :25)
        )

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(categoryDM.imagePath,width: 132,height: 116),
          Text(categoryDM.title,style: AppStyles.categoryTitle,),
        ],
      ),
    ) ;
  }
}
