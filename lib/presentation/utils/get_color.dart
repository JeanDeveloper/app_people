import 'package:flutter/material.dart';

Color getColor(Set<MaterialState> states) {

  if (states.contains(MaterialState.focused) && states.contains(MaterialState.hovered)){
    return Colors.red;
  } else if( states.contains(MaterialState.focused )){
    return Colors.purple;
  }else if(states.contains(MaterialState.hovered)){
    return Colors.black;
  }

  return Colors.yellow;

}