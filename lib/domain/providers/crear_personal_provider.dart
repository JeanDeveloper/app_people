import 'dart:io';

import 'package:flutter/material.dart';

class CrearPersonalProvider extends ChangeNotifier{


  //controla el step
  int _index = 0;
  
  //controla el tipo de persona
  int _tipoPersona =  1;

  //controla el listradiobutton de tipo de documento.
  int _tipoDocumento = 1;

  //controla el numero de documento.
  String _nDocumento = "";

  //controla el primer nombre.
  String _pNombre = "";

  //controla el segundo nombre.
  String _sNombre = "";

  //controla el primer apellido.
  String _pApellido = "";

  //controla el segundo apellido.
  String _sApellido = "";

  //controla la empresa.
  int _empresa = 1;

  //controla el cargo.
  int _cargo = 1;

  //controla el campo sexo.
  int _sexo = 1;
  
  //controla la foto
  File? foto;

  //llave para validar los campos
  List<GlobalKey<FormState>> formKeys = [GlobalKey<FormState>(), GlobalKey<FormState>()];

  //controla el tipo Persona.
  int get tipoPersona =>_tipoPersona; 
  set tipoPersona (int valor){
    _tipoPersona = valor;
    notifyListeners();
  }

  //VALOR DOCUMENTO
  String get nDocumento =>_nDocumento; 

  set nDocumento(String valor){
    _nDocumento = valor;
    notifyListeners();
  }

  //TIPO DOCUMENTO
  int get tipoDocumento =>_tipoDocumento; 

  set tipoDocumento(int valor){
    _tipoDocumento = valor;
    notifyListeners();
  }

  //NUMERO DE DOCUMENTO
  int get valorSexo =>_sexo; 

  set valorSexo(int valor){
    _sexo = valor;
    notifyListeners();
  }

  //PRIMER NOMBRE
  String get pNombre => _pNombre;

  set pNombre (String valor){
    _pNombre = valor;
    notifyListeners();
  }

  //SEGUNDO NOMBRE
  String get SNombre => _sNombre;

  set sNombre (String valor){
    _sNombre = valor;
    notifyListeners();
  }

  //PRIMER APELLIDO
  String get pApellido => _pApellido;

  set pApellido (String valor){
    _pApellido = valor;
    notifyListeners();
  }

  //SEGUNDO APELLIDO
  String get sApellido => _sApellido;

  set sApellido (String valor){
    _sApellido = valor;
    notifyListeners();
  }

  //EMPRESA
  int get empresa =>_empresa; 

  set empresa(int valor){
    _empresa = valor;
    notifyListeners();
  }

  //CARGO
  int get cargo =>_cargo; 

  set cargo(int valor){
    _cargo = valor;
    notifyListeners();
  }

  //SEXO
  int get sexo =>_sexo;

  set sexo(int valor){
    _sexo = valor;
    notifyListeners();
  }

  //FOTO
  // File? get foto =>_foto;

  // set foto (File valor){
  //   _foto = valor;
  //   notifyListeners();
  // }

  //FOTO
  void updateImage( String path ){

    foto = File.fromUri(Uri(path: path));
    
    notifyListeners();

  }


  //STEP
  int get getValorStep => _index;

  set setValorStep(int valor){
    _index = valor;
    notifyListeners();
  }


  bool isValidForm(int index){
    
    return formKeys[index].currentState?.validate() ?? false;
  
  }


}