import 'package:flutter/material.dart';

class IngresoValidadoProvider extends ChangeNotifier{

  int _autorizante = 0;
  
  int _motivo = -1;
  int _area_acceso = -1;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _isLoading = false;


  // METODOS PARA LA VARIABLE LOADING
  bool get isLoading => _isLoading;

  set isLoading ( bool value) {
    _isLoading = value;
    notifyListeners();
  }


  // METODOS PARA LA VARIABLE AUTORIZANTE
  int get autorizante => _autorizante;

  set autorizante (int value) {
    _autorizante = value;
    notifyListeners();
  }


  // METODOS PARA LA VARIABLE MOTIVO
  int get motivo => _motivo;

  set motivo ( int value) {
    _motivo = value;
    notifyListeners();
  }

  // METODOS PARA LA VARIABLE AREA ACCESO
  int get area_acceso => _area_acceso;

  set area_acceso ( int  value) {
    _area_acceso = value;
    notifyListeners();
  }

  
  bool isValidForm(){
    
    print(formKey.currentState?.validate());
    return formKey.currentState?.validate() ?? false;
  
  }

}