import 'package:flutter/material.dart';

class NumPadProvider extends ChangeNotifier{

  String _number = '';

  String get number => _number;

  set number(String valor){

    _number = valor;
    notifyListeners();
  
  }

  setValue( String valor, int tamanio ){

    if(number.length<tamanio){
      _number +=valor;
      notifyListeners();
    }

  }

  backspace(String text){

    if(text.isNotEmpty){

      number = text.split('').sublist(0,text.length-1).join('');
      notifyListeners();

    }

  }






}