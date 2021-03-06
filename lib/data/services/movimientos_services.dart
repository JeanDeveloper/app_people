import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:apppeople/domain/models/consulta_personal_model.dart';
import 'package:apppeople/domain/models/movimientos_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MovimientosProvider extends ChangeNotifier{
  
  final String _url   = '192.168.10.58:8000';
  
  final bool cargando = false;

  List<MovimientoModel> movimientosSelected = [];

  List<MovimientoModel> movimientosTotalesSelected = [];

  String tipoSeleccionado = 'todos';

  int movimientosContador = 0;

  int get getmovimientosContador => movimientosContador;


  //PETICION GET
  Future<List<MovimientoModel>> _procesarRespuestaGet(Uri url) async {
    
    final resp = await http.get( 
      url, 
      headers:  {HttpHeaders.contentTypeHeader: "application/json;  charset=utf-8"}
    );

    final decodedData = json.decode(utf8.decode(resp.bodyBytes));

    final movimientos = MovimientosModel.fromJsonList(decodedData);

    return movimientos.items;
    
  }

  //PETICION POST
  Future<int> _procesarRespuestaPost(Uri url, ConsultaModel consulta) async{

    final resp = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{

        'codigo_personal' : '${consulta.codigoPersona}',
        'codigo_servicio' : '${consulta.codigoServicio}',
        'codigo_tipo_movimiento': '${consulta.codigoMovSgt}',
        'codigo_tipo_motivo' : '${consulta.codigoMotivo}',
        'codigo_empresa':  '${consulta.codigoEmpresa}',
        'autorizado_por' : '${consulta.codigoAutorizante}',
        'creado_por' : 'TABLET_ ${consulta.codigoServicio}',
        'codigo_area': '${consulta.codigoArea}',

      }),

    );

    if ( resp.statusCode == 201 ){
      return 1;


    }else{

      return -1;

    }


  }

  //OBTENER DE MOVIMIENTOS
  Future<List<MovimientoModel>> getMovimientos( String idServicio,  String tipoMovimiento, {String tipoPersonal= "0"}) async {

    final url = Uri.http( _url, 'movimientos/', {
      'tipoMovimiento': tipoMovimiento,
      'idServicio': idServicio,
      'tipoPersonal': tipoPersonal,
    } );

    final movimientos = await _procesarRespuestaGet(url);


    if(tipoPersonal == '0')
      movimientosTotalesSelected = [...movimientos];
    

    movimientosContador = movimientos.length;

    movimientosSelected = [...movimientos];
    
    notifyListeners();

    return movimientos;
    
  }

  //CONSULTAR UN MOVIMIENTO
  Future<List<MovimientoModel>> getSearchMovimientos(String query)async{

    final List<MovimientoModel> movimientosFiltered = [];

    Future.delayed(const Duration(seconds: 3));

    for( int i= 0; i< movimientosTotalesSelected.length; i++ ) {

      if (movimientosTotalesSelected[i].dni!.contains(query)){

        movimientosFiltered.add(movimientosTotalesSelected[i]);
      
      }
    
    }

    return movimientosFiltered;

  }

  //REGISTRAR UN MOVIMIENTO
  Future<int> registerMovimiento(ConsultaModel consulta)async{

    final url = Uri.http(_url, 'movimientos/');

    final movimientoId = await _procesarRespuestaPost(url, consulta);

    return movimientoId;

  }

}
