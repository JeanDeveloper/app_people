import 'dart:convert';
import 'package:apppeople/domain/models/response_personal_model.dart';
import 'package:apppeople/domain/providers/crear_personal_provider.dart';
import 'package:apppeople/domain/providers/login_global.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';


class PersonalProvider{

  final String _url = '192.168.10.58:8000';
  final bool cargando = false;

  //CONSULTA POST
  Future<ResponsePersonalModel> procesarRegistroPersonal(BuildContext context ) async{

    final personalProvider = Provider.of<CrearPersonalProvider>(context, listen: false);
    final globalProvider = Provider.of<LoginGlobalProvider>(context, listen: false);

    final url = Uri.http(_url, 'personal/');


    final _body = jsonEncode({
        'codigo_personal': 0,
        'codigo_tipo_personal': personalProvider.tipoPersona,
        'codigo_empresa': personalProvider.empresa,
        'codigo_tipo_documento': personalProvider.tipoDocumento,
        'codigo_cargo': personalProvider.cargo,
        'nombre1': personalProvider.pNombre,
        'nombre2': personalProvider.SNombre,
        'apellido1': personalProvider.pApellido,
        'apellido2': personalProvider.sApellido,
        'doc_personal': personalProvider.nDocumento,
        'sexo': (personalProvider.sexo==1)? 'M' : 'F',
        'creado_por': 'PEOPLE_${globalProvider.codServicio}',
        'brevete': '',
        'es_autorizante': 0,
        'habilitado': 1,
        'tiene_foto': (personalProvider.foto==null) ? 0 : 1,
        'codigo_cliente_control': globalProvider.codCliente,
    });

    final resp = await http.post(
      url,
      headers: {
        'Content-Type': "application/json; charset=utf-8",
      },
      body: _body,
    );

    final decodedData = json.decode(resp.body);
    final consulta = ResponsePersonalModel.fromJson( decodedData );
    return consulta;

  }

}