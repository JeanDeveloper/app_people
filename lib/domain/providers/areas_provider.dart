import 'package:apppeople/data/services/area_service.dart';
import 'package:apppeople/domain/models/area_model.dart';
import 'package:flutter/material.dart';

class AreasProvider extends ChangeNotifier{

  AreaService listaArea = AreaService();
  List<AreaDbModel> itemsareas = [];


  Future<void> initAreas(String codServicio, String codCliente)async{
    if(itemsareas.isEmpty){
      itemsareas = await listaArea.getAreas(codServicio, codCliente);
      notifyListeners();
    }

  }


}
