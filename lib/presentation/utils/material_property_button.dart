import 'package:apppeople/theme/theme.dart';
import 'package:flutter/material.dart';

class ButtonBackGroundColor extends MaterialStateProperty<Color?>{
  
  ButtonBackGroundColor(context);

  @override
  Color? resolve(Set<MaterialState> states) {

    if(states.contains(MaterialState.pressed)) {
      return Colors.white;
    }

    return AppTheme.lighTheme.backgroundColor;
    
  }


}