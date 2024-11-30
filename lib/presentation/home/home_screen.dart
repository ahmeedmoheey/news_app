
import 'package:flutter/material.dart';
import 'package:news_app/presentation/tabs/categories/categories_details/categories_details.dart';

import '../../core/assets_manager.dart';
import '../../core/colors_manager.dart';
import '../../data_model/category_DM.dart';
import '../tabs/categories/categories.dart';
import '../tabs/settings/settings.dart';
import 'article_search_delegate.dart';
import 'home_drawer/home_drawer.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Widget selectedWidget = Categories(onCategoryClicked: onCategoryClicked) ;
  String appBarTitle = 'News App';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: ColorsManager.white,
          image: DecorationImage(image: AssetImage(AssetsManager.pattern))),
      child: Scaffold(

          appBar: AppBar(
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: NewsSearchDelegate(
                    ),
                  );
                },
              ),
            ],
            title:  Text(appBarTitle),
          ),
          drawer: HomeDrawer(
            onMenuItemClicked: onDrawerItemClick,
          ),
          body: selectedWidget),
    );
  }

  void onCategoryClicked(CategoryDM categoryDM){
    selectedWidget = CategoryDetails(categoryDM: categoryDM,);
    appBarTitle = categoryDM.title;
    setState(() {

    });
  }

  void onDrawerItemClick(MenuItem item) {
    Navigator.pop(context);
    if (item == MenuItem.categories) {
      selectedWidget = Categories(onCategoryClicked: onCategoryClicked,);
    } else if (item == MenuItem.settings) {
      selectedWidget = Settings();
    }
    setState(() {});
  }
}
