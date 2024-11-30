
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_styles.dart';
import '../../../../data_model/category_DM.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({super.key, required this.categoryDM, required this.index});

  CategoryDM categoryDM;
  int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: categoryDM.bgColor,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25.r),
              topLeft: Radius.circular(25.r),
              bottomLeft: Radius.circular(index.isEven ? 25 : 0),
              bottomRight: Radius.circular(index.isEven ? 0 : 25))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            categoryDM.imagePath,
            width: 132.w,
            height: 116.h,
          ),
          Text(
            categoryDM.title,
            style: AppStyles.categoryTitle,
          ),
        ],
      ),
    );
  }
}
