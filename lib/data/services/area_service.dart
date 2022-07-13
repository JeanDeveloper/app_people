import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:apppeople/domain/models/area_model.dart';
import 'package:http/http.dart' as http;


class AreaService {

  final String _url = '192.168.10.58:8000';

  //PETICION GET
  Future<List<AreaDbModel>> _procesarRespuestaGet( Uri url )async{

    final response = await http.get(

      url,
      headers: {HttpHeaders.contentTypeHeader: "application/json;  charset=utf-8"}

    );

    if(response.statusCode == 200){

      final decodedData = json.decode(utf8.decode(response.bodyBytes)) ;

      final areas = AreasDBModel.fromJsonList(decodedData);

      return areas.items;

    }else{
      return[];
    }

  }

  //OBTENCION DE LOS AUTORIZANTES
  Future<List<AreaDbModel>> getAreas(String codServicio, String codCliente)async{

    final url = Uri.http( _url, 'areas/', {
      'idServicio': codServicio,
      'codCliente': codCliente,
    });

    final areas = await _procesarRespuestaGet(url);
    
    return areas;

  }


}
