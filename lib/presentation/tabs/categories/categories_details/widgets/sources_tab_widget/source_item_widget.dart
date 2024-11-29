import 'package:flutter/material.dart';
import 'package:news_app/core/app_styles.dart';
import 'package:news_app/core/colors_manager.dart';
import 'package:news_app/data/api/model/sources_response/source.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SourceItemWidget extends StatelessWidget {
  SourceItemWidget({super.key, required this.source, required this.isSelected});

  Source source;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.symmetric(vertical: 8, horizontal: 12),
      margin: REdgeInsets.symmetric(
        vertical: 8,
      ),
      decoration: BoxDecoration(
          color: isSelected ? ColorsManager.green : Colors.transparent,
          borderRadius: BorderRadius.circular(25.r),
          border: Border.all(color: ColorsManager.green, width: 2)),
      child: Text(
        source.name ?? '',
        style: isSelected ? AppStyles.selectedLabel : AppStyles.unSelectedLabel,
      ),
    );
  }
}