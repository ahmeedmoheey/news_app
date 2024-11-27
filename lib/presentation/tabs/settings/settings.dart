import 'package:flutter/material.dart';

import '../../../core/app_styles.dart';
import '../../../core/strings_manager.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26,vertical: 29),
        child: Column(
          children: 
          [
            Text(StringsManager.language,style: AppStyles.language,),
            SizedBox(height: 18,),
            Container(
              padding: EdgeInsets.all(16),
              alignment:  Alignment.centerLeft,
              height: 48,
              width: 319,
              decoration: BoxDecoration(
                color:Colors.white,
                borderRadius: BorderRadius.circular(1),
                  border: Border.all(color: Colors.green,width: 1)
              ),
              child: Text(StringsManager.english,style: AppStyles.english,),
            )
          ],
        ),
      )
    );
  }
}
