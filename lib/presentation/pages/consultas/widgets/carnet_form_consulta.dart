import 'package:apppeople/domain/helpers/show_snackbar_awesome.dart';
import 'package:apppeople/presentation/utils/styles.dart';
import 'package:apppeople/presentation/widgets/numpad_widget_v2.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

class CarnetFormConsulta extends StatelessWidget {
  const CarnetFormConsulta({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;
    
    return Column(

      children: [

        AutoSizeText('INGRESE EL CARNET DE EXTRANJERIA', style: textstylewelcome(context), maxLines: 1, minFontSize: 6,),            
        
        NumPad(
          
          length: 9,

          onPressed: (String value) async{

            if( value == '' || value.length<9 ){
              
              showSnackBarAwesome(context, 'Error', 'Ingrese un Pasaporte valido', ContentType.failure);

            }else{

              // consultarMovimiento(context, value, '2774');

            }

          },

        )
      
      ],

    );

    
  }
}