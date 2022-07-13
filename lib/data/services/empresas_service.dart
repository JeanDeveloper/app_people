import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:apppeople/domain/models/listado_empresas_model.dart';
import 'package:http/http.dart' as http;


class EmpresasProvider {

  final String _url = '192.168.10.58:8000';

  final bool cargando     = false;

  // peticion GET
  Future<List<EmpresaModel>> _procesarRespuestaGet(Uri url) async {

    final resp  =  await http.get(

      url,
      headers: {HttpHeaders.contentTypeHeader: "application/json;  charset=utf-8"}

    );

    if(resp.statusCode ==200){

      final decodedData = json.decode(utf8.decode(resp.bodyBytes));
      final empresas = EmpresasModel.fromJsonList(decodedData);
      return empresas.items;

    }else{
      return [];
    }

  }
                      
  //obtener las empresas
  Future<List<DropdownMenuItem<int>>> getEmpresas(String codEmpresa, String nomEmpresa)async{
    
    List<DropdownMenuItem<int>> menuItems = [];

    final url = Uri.http( _url, 'empresas/', {
      'nombreEmpresa': nomEmpresa,
      'codEmpresa': codEmpresa,
    } );

    final empresas = await _procesarRespuestaGet(url);

    for (var i=0; i<empresas.length; i++) {

      DropdownMenuItem<int> item =  DropdownMenuItem(value: int.parse(empresas[i].codigo!), child: Text(empresas[i].empresa!));
      menuItems.add(item);

    }

    return menuItems;


  }


}