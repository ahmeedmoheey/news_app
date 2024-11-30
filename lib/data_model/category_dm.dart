
import 'package:flutter/material.dart';
import '../core/assets_manager.dart';
import '../core/colors_manager.dart';
import '../core/constant_manager.dart';
import '../core/strings_manager.dart';

class CategoryDM {
  String id;
  String title;
  Color bgColor;
  String imagePath;
  CategoryDM({required this.id,
    required this.title,
    required this.bgColor,
    required this.imagePath,
  });

  static List<CategoryDM> getAllCategories() =>
      [
        CategoryDM(
          id: ConstantManager.sportsId,
          title: StringsManager.sports,
          bgColor: ColorsManager.red,
          imagePath: AssetsManager.sports,
        ),
        CategoryDM(
          id: ConstantManager.generalId,
          title: StringsManager.general,
          bgColor: ColorsManager.darkBlue,
          imagePath: AssetsManager.politics,
        ),
        CategoryDM(
          id: ConstantManager.healthId,
          title: StringsManager.health,
          bgColor: ColorsManager.pink,
          imagePath: AssetsManager.health,
        ),
        CategoryDM(
          id: ConstantManager.businessId,
          title: StringsManager.business,
          bgColor: ColorsManager.brown,
          imagePath: AssetsManager.bussiness,
        ),
        CategoryDM(
          id: ConstantManager.environmentId,
          title: StringsManager.environment,
          bgColor: ColorsManager.lbny,
          imagePath: AssetsManager.environment,
        ),
        CategoryDM(
          id: ConstantManager.scienceId,
          title: StringsManager.science,
          bgColor: ColorsManager.yellow,
          imagePath: AssetsManager.science,
        ),
        CategoryDM(
          id: ConstantManager.entertainmentId,
          title: StringsManager.entertainment,
          bgColor: ColorsManager.grewAcc,
          imagePath: AssetsManager.entertainment,
        ),

      ];
  static get(){
    print('Hello');
  }
}