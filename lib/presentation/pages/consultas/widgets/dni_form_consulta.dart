import 'package:apppeople/domain/helpers/show_snackbar_awesome.dart';
import 'package:apppeople/domain/providers/login_global.dart';
import 'package:apppeople/domain/repositories/validaciones/validacion_consulta.dart';
import 'package:apppeople/presentation/widgets/numpad_widget_v2.dart';
import 'package:apppeople/theme/theme.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DNIFormConsulta extends StatelessWidget {
  
  const DNIFormConsulta({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final loginGlobal = Provider.of<LoginGlobalProvider>(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [

        AutoSizeText('INGRESE EL NUMERO DE DNI', style: AppTheme.lighTheme.textTheme.headline2,), 

        NumPad(
          
          length: 8,

          onPressed: (String value) async{

            if( value == '' || value.length<8 ){
              
              showSnackBarAwesome(context, 'Error', 'Ingrese un dni valido', ContentType.failure);

            }else{

              validarConsulta(context, value, loginGlobal.codServicio);

            }

          },

        )
      
      ],

    );
  
  }

}