
import 'package:flutter/material.dart';
import 'package:news_app/core/app_styles.dart';

import '../../core/assets_manager.dart';
import '../../core/colors_manager.dart';
import '../tabs/categories/categories.dart';
import '../tabs/settings/settings.dart';
import 'home_drawer/home_drawer.dart';
class HomeScreens extends StatefulWidget {
  HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeState();
}

class _HomeState extends State<HomeScreens> {
  late Widget selectedWidget = Categories() ;
  String appBarTitle = 'News App';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: ColorsManager.white,
          image: DecorationImage(image: AssetImage(AssetsManager.pattern))),
      child: Scaffold(
          appBar: AppBar(
            title:  Text(appBarTitle,style: AppStyles.appTitle,),
          ),
          drawer: HomeDrawer(
            onMenuItemClicked: onDrawerItemClick,
          ),
          body: selectedWidget),
    );
  }



  void onDrawerItemClick(MenuItem item) {
    Navigator.pop(context);
    if (item == MenuItem.categories) {
      selectedWidget = Categories();
    } else if (item == MenuItem.settings) {
      selectedWidget = Settings();
    }
    setState(() {});
  }
}
