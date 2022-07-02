import 'package:apppeople/domain/providers/ingreso_validado_provider.dart';
import 'package:apppeople/presentation/utils/dropdown_item.dart';
import 'package:apppeople/presentation/utils/styles.dart';
import 'package:apppeople/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class IngresoValidadoWidget extends StatelessWidget {

  const IngresoValidadoWidget({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final ingresoProvider = Provider.of<IngresoValidadoProvider>(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal:30),
      width: double.infinity,
      height: size.height*0.4,

      child: Column(

        children: [

          const Text('AGREGAR A LA PERSONA AUTORIZANTE', style: TextStyle(color: Colors.red, fontSize: 20)),
          SizedBox(height: size.height*0.02), 

          //CAMPO AUTORIZANTE
          Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
  
            children: [
  
              Text('AUTORIZANTE:  ', style: styleCrearPersonaltextForm()),
              
              //ESTA PARA CAMBIARLO POR EL WIDGET CREADO.
              DropdownButtonWidget(

                items: dropdownItemsAutorizantesDisponibles, 
                hintText: 'AUTORIZANTES DISPONIBLES', 
                onchanged: (value) => ingresoProvider.autorizante=value
                
              ),



            ],

          ),
          SizedBox(height: size.height*0.02), 

          //CAMPO MOTIVO
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
  
            children: [
  
              Text('MOTIVO:  ', style: styleCrearPersonaltextForm()),

              DropdownButtonWidget(

                items: dropdownItemsMotivosDisponibles, 
                hintText: 'MOTIVOS DISPONIBLES', 
                onchanged: (value) => ingresoProvider.motivo = value
                
              ),

            ],
          ),
          SizedBox(height: size.height*0.02), 

          //CAMPO ACCESO
          Row(
 
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
  
            children: [
  
              Text('AREA DE ACCESO:', style: styleCrearPersonaltextForm(), maxLines: 2),


              DropdownButtonWidget(

                items: dropdownItemsAreaAccesos, 
                hintText: 'ACCESOS DISPONIBLES', 
                onchanged: (value) => ingresoProvider.area_acceso = value
                
              ),

            ],
          ),
          SizedBox(height: size.height*0.02), 
        
        ],

      ),

    );

  }

}