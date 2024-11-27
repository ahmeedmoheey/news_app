import 'package:flutter/material.dart';

import '../core/assets_manager.dart';
import '../core/colors_manager.dart';
import '../core/routes_manager.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed( const Duration(seconds: 2), () {

      Navigator.pushReplacementNamed(context, RoutesManager.home);
    });
    return Container(
      decoration: BoxDecoration(
        color: ColorsManager.white,
        image: DecorationImage(image: AssetImage(AssetsManager.pattern))
      ),
      child: Scaffold(
           body: Stack(
             children: [
               Positioned(
                   top: 331,
                   left: 107,
                   child: Image.asset(AssetsManager.logo,width: 199,))
             ],
           ),
      ),
    );
  }
}
