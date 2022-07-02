import 'package:flutter/material.dart';

class RadioBackgroundColor implements MaterialStateProperty<Color?> {


  @override
  Color? resolve(Set<MaterialState> states){

    if(states.contains(MaterialState.focused) && states.contains(MaterialState.hovered)){
      return Colors.black;
    } else if(states.contains(MaterialState.focused)){
      return Colors.yellow;
    } else if(states.contains(MaterialState.hovered)){
      return Colors.blue;
    }
    return null;

  }


}