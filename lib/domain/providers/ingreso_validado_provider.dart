import 'package:flutter/material.dart';

class IngresoValidadoProvider extends ChangeNotifier{

  String dni = '76216238';
  String nombre = 'JEAN CARLO CHUNGA';
  String cargo = 'OPERADOR'; 
  String empresa = 'SOLMAR SECURITY SAC';
  
  String _autorizante = 'GLADYS SILVA';
  String _motivo = 'REUNION';
  String _area_acceso = 'SISTEMAS';
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _isLoading = false;


  // METODOS PARA LA VARIABLE LOADING
  bool get isLoading => _isLoading;

  set isLoading ( bool value) {
    _isLoading = value;
    notifyListeners();
  }


  // METODOS PARA LA VARIABLE AUTORIZANTE
  String get autorizante => _autorizante;

  set autorizante (value) {
    _autorizante = value;
    notifyListeners();
  }


  // METODOS PARA LA VARIABLE MOTIVO
  String get motivo => _motivo;

  set motivo ( value) {
    _motivo = value;
    notifyListeners();
  }

  // METODOS PARA LA VARIABLE AREA ACCESO
  String get area_acceso => _area_acceso;

  set area_acceso ( value) {
    _area_acceso = value;
    notifyListeners();
  }

  
  bool isValidForm(){
    
    print(formKey.currentState?.validate());
    return formKey.currentState?.validate() ?? false;
  
  }

}