
import 'package:apppeople/data/services/motivo_service.dart';
import 'package:apppeople/domain/models/motivo_model.dart';
import 'package:flutter/material.dart';

class MotivoProvider extends ChangeNotifier{

  MotivoService listaAutorizante = MotivoService();
  List<MotivoDbModel> itemsMotivo = [];

  Future<void> initMotivo(String codServicio, String codCliente)async{
    
    if(itemsMotivo.isEmpty){

      itemsMotivo = await listaAutorizante.getMotivos(codServicio, codCliente); 

      notifyListeners();
    }

  }


}
