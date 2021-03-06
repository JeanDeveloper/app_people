import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:apppeople/domain/models/consulta_personal_model.dart';
import 'package:http/http.dart' as http;

class ConsultaProvider {

  final String _url = '192.168.10.58:8000';

  final bool cargando = false;

  late ConsultaModel consulta;

  Future<ConsultaModel> _procesarRespuestaGet(Uri url) async{

    final resp  = await http.get(
      url,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json; charset= utf-8",
      }

    );

    if(resp.statusCode ==200){
      
      final decodedData = json.decode(resp.body);
      final consulta = ConsultaModel.fromJson( decodedData[0] );
      return consulta;

    }else{

      throw Exception('Error al cargar la Consulta');
    
    }


  }
  
  // METODO PARA LA CONSULTA 
  Future<ConsultaModel>  getConsulta(String doc, String idServicio)async{
    
    final url = Uri.http(_url, 'detalle-personal/',{

      'doc': doc,
      'idServicio' : idServicio,

    });

    final consulta = await _procesarRespuestaGet(url);
    
    return consulta;

  }

}