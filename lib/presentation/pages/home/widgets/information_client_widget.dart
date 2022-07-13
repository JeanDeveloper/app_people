import 'package:apppeople/domain/providers/login_global.dart';
import 'package:apppeople/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InformacionCliente extends StatelessWidget {
  
  const InformacionCliente({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    final loginGlobal = Provider.of<LoginGlobalProvider>(context);


    return Container(

      width: double.infinity,
      height: size.height*0.9,

      child: SafeArea(

        child: Column(
          
          children: [
            
            SizedBox(height: size.height*0.15),

            FadeInImage(
              width: size.width*0.48,
              height: size.width*0.48,
              placeholder: const AssetImage('assets/loading.gif'), 
              image: const AssetImage('assets/saasa.png')
            ),

            SizedBox(height: size.height*0.015),
            
            Text(
              loginGlobal.nombreTipoServicio,
              style: AppTheme.lighTheme.textTheme.headline1
            ),// NOMBRE DEL TIPO DE SERVICIO - dinamico

            SizedBox(height: size.height*0.015),
            
            Text(
              loginGlobal.nombreServicio,
              style: AppTheme.lighTheme.textTheme.headline3?.copyWith(  
                color: Colors.amber
              )
            ),//NOMBRE DEL SERVICIO - dinamico
            
            Text(
              loginGlobal.codServicio,
              style: AppTheme.lighTheme.textTheme.headline1 
            ),//CODIGO DEL SERVICIO - dinamico
            
          ],

        ),

      ),
      
    );
    
  }

}