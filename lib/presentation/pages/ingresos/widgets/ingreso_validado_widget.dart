import 'package:apppeople/domain/models/area_model.dart';
import 'package:apppeople/domain/models/autorizante_model.dart';
import 'package:apppeople/domain/models/consulta_personal_model.dart';
import 'package:apppeople/domain/models/motivo_model.dart';
import 'package:apppeople/domain/providers/areas_provider.dart';
import 'package:apppeople/domain/providers/autorizantes_provider.dart';
import 'package:apppeople/domain/providers/ingreso_validado_provider.dart';
import 'package:apppeople/domain/providers/login_global.dart';
import 'package:apppeople/domain/providers/motivo_provider.dart';
import 'package:apppeople/presentation/utils/styles.dart';
import 'package:apppeople/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class IngresoValidadoWidget extends StatelessWidget {

  final ConsultaModel consulta;
  
  const IngresoValidadoWidget({
    Key? key, 
    required this.consulta
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    

    final size = MediaQuery.of(context).size;
    final loginglobal = Provider.of<LoginGlobalProvider>(context);
    final ingresoProvider = Provider.of<IngresoValidadoProvider>(context);
    
    final autorizanteProvider = Provider.of<AutorizanteProvider>(context);
    final motivoProvider = Provider.of<MotivoProvider>(context);
    final areaProvider = Provider.of<AreasProvider>(context);


    autorizanteProvider.initAutorizantes(loginglobal.codServicio, consulta.codigoTipoPersona.toString());    
    motivoProvider.initMotivo(loginglobal.codServicio,loginglobal.codCliente);
    areaProvider.initAreas(loginglobal.codServicio,loginglobal.codCliente);


    return Container(
      padding: const EdgeInsets.symmetric(horizontal:30),
      width: double.infinity,
      height: size.height*0.4,

      child: Column(

        children: [


          SizedBox(height: size.height*0.02), 
          const Text('AGREGAR A LA PERSONA AUTORIZANTE', style: TextStyle(color: Colors.red, fontSize: 20)),
          SizedBox(height: size.height*0.02), 

          //CAMPO AUTORIZANTE
          Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
  
            children: [
  
              Text('AUTORIZANTE:  ', style: styleCrearPersonaltextForm()),

              (autorizanteProvider.itemsAutorizante.isNotEmpty)
                ? DropdownButtonWidget(
                
                  items: autorizanteProvider.itemsAutorizante
                    .map((AutorizanteDbModel autorizante) => 
                      DropdownMenuItem<int>(
                        value:int.parse(autorizante.codPersonal!),
                        child: Text(autorizante.nombrePersonal!)
                      )).toList(),

                  hintText: 'AUTORIZANTES DISPONIBLES', 
                  onchanged: (value) => ingresoProvider.autorizante=value!
                
                ):Expanded(

                  child: Container(

                    alignment: Alignment.center, 
                    child:const  CircularProgressIndicator(),

                  ),
                
                ),



              
 


            ],

          ),
          SizedBox(height: size.height*0.02), 

          //CAMPO MOTIVO
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
  
            children: [
  
              Text('MOTIVO:  ', style: styleCrearPersonaltextForm()),

              (motivoProvider.itemsMotivo.isNotEmpty)
                ? DropdownButtonWidget(
                
                  items: motivoProvider.itemsMotivo
                    .map((MotivoDbModel motivo) => 
                      DropdownMenuItem<int>(
                        value:int.parse(motivo.codigo!),
                        child: Text(motivo.tipo!)
                      )).toList(),

                  hintText: 'MOTIVOS DISPONIBLES', 
                  onchanged: (value) => ingresoProvider.motivo = value!
                
                ):Expanded(

                  child: Container(

                    alignment: Alignment.center, 
                    child:const  CircularProgressIndicator(),

                  ),
                
                ),


            ],
          ),
          SizedBox(height: size.height*0.02), 

          //CAMPO ACCESO
          Row(
 
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
  
            children: [
  
              Text('AREA DE ACCESO:', style: styleCrearPersonaltextForm(), maxLines: 2),


              (areaProvider.itemsareas.isNotEmpty)
                ? DropdownButtonWidget(
                
                  items: areaProvider.itemsareas
                    .map((AreaDbModel area) => 
                      DropdownMenuItem<int>(
                        value:int.parse(area.codigo!),
                        child: Text(area.area!)
                      )).toList(),

                  hintText: 'AREAS DISPONIBLES', 
                  onchanged: (value) => ingresoProvider.area_acceso = value!
                
                ):Expanded(

                  child: Container(

                    alignment: Alignment.center, 
                    child:const  CircularProgressIndicator(),

                  ),
                
                ),



            ],
          ),
          SizedBox(height: size.height*0.02), 
        
        ],

      ),

    );

  }

}