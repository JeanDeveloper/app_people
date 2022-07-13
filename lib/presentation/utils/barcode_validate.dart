import 'package:apppeople/domain/providers/login_global.dart';
import 'package:apppeople/domain/providers/numpad_provider.dart';
import 'package:apppeople/domain/repositories/validaciones/consutar_movimiento.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

barcodeScan(BuildContext context, String barcode){

  final numpadProvider = Provider.of<NumPadProvider>(context, listen: false);
  final loginProvider= Provider.of<LoginGlobalProvider>(context);

  if(barcode == '-1'){

    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,

      content: AwesomeSnackbarContent(
        title: '¡Alerta!',
        message:'Lo siento, no se ha recibido nada',
        contentType: ContentType.warning,
      ),

    );

    return ScaffoldMessenger.of(context).showSnackBar(snackBar);
    
  }else{

    numpadProvider.number = barcode;

    Future.delayed(const Duration(seconds: 2));
    
    consultarMovimiento(context, numpadProvider.number, loginProvider.codServicio);
    
  }

}