import 'package:apppeople/data/services/consulta_services.dart';
import 'package:apppeople/domain/models/consulta_personal_model.dart';
import 'package:apppeople/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';

void consultarMovimiento(BuildContext context, String documento, String codServicio ) async {

  CustomProgressDialog progressDialog = CustomProgressDialog(context,blur: 10);
  progressDialog.setLoadingWidget(CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(AppTheme.lighTheme.primaryColor)));
  progressDialog.show();

  ConsultaModel consulta = await ConsultaProvider().getConsulta(documento, codServicio);

  progressDialog.dismiss();
  
  if(consulta.resultado == 'OK'){
    
    if(consulta.tipoConsulta == 'INGRESO AUTORIZADO'){
      
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, 'ingreso_autorizado', arguments: consulta);

    }else {
      
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, 'salida_autorizada', arguments: consulta);
      
    }

  }else{
    
    if(consulta.docPersona != null){
      
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, 'ingreso_denegado', arguments: consulta);

    }else{

      // ignore: use_build_context_synchronously
      await NDialog(

        dialogStyle: DialogStyle(titleDivider: true, backgroundColor: Colors.white),
        title:  const Text("INFORMACION",  style: TextStyle(color: Colors.black)),
        content:  const Text("El personal no se encuentra en el sistema \n ¿Deseas registar al personal?", style: TextStyle(color: Colors.black)),  
        
        actions: <Widget>[

          TextButton(

            child: const Text("Si"),

            onPressed: ()=>Navigator.pushReplacementNamed(context, 'crear_personal', arguments: {
              "dni_persona" : documento,
              "cod_servicio" : codServicio,
            }), 

          ),

          TextButton(

            child: const Text("No"),
            onPressed: ()=> Navigator.pop(context)

          ),

        ],
      
      ).show(context);

    }

  }


}