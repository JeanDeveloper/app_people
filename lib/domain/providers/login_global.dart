import 'package:flutter/material.dart';

class LoginGlobalProvider extends ChangeNotifier{

  late String _codCliente = '25866';
  late String _nombreTipoServicio = 'PLANTA';
  late String _nombreServicio = 'TERMINAL DE ALMACENAMIENTO';
  late String _codServicio = '2774';



  //METODOS PARA LA VARIABLE EMPRESA
  String get codCliente => _codCliente;

  set codCliente(String valor){
    _codCliente = valor;
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