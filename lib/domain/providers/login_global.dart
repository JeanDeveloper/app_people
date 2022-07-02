import 'package:flutter/material.dart';

class LoginGlobalProvider extends ChangeNotifier{

  late String _codEmpresa = '25866';
  late String _nombreTipoServicio = '';
  late String _nombreServicio = 'TERMINAL DE ALMACENAMIENTO';
  late String _codServicio = '2774';



  //METODOS PARA LA VARIABLE EMPRESA
  String get codEmpresa => _codEmpresa;

  set codEmpresa(String valor){
    _codEmpresa = valor;
    notifyListeners();
  }

  //METODOS PARA LA VARIABLE SERVICIO
  String get codServicio => _codServicio;

  set codServicio(String valor){
    _codServicio = valor;
    notifyListeners();
  }


  //METODOS PARA LA VARIABLE NOMBRE SERVICIO    
  String get nombreServicio => _nombreServicio;

  set nombreServicio(String valor){
    _nombreServicio = valor;
    notifyListeners();
  }

  //METODOS PARA LA VARIABLE NOMBRE TIPO SERVICIO
  String get nombreTipoServicio => _nombreTipoServicio;

  set nombreTipoServicio(String valor){
    _nombreTipoServicio = valor;
    notifyListeners();
  }



}