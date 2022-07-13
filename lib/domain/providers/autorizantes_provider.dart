import 'package:apppeople/data/services/autorizante_service.dart';
import 'package:apppeople/domain/models/autorizante_model.dart';
import 'package:flutter/material.dart';

class AutorizanteProvider extends ChangeNotifier{

  AutorizanteService listaAutorizante = AutorizanteService();

  List<AutorizanteDbModel> itemsAutorizante = [];

  Future<void> initAutorizantes(String codServicio, String tipoPersonal)async{
    if(itemsAutorizante.isEmpty){
      itemsAutorizante = await listaAutorizante.getAutorizantes(codServicio, tipoPersonal); 
      notifyListeners();
    }

  }


}
