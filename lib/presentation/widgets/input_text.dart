import 'package:apppeople/presentation/utils/input_decoration_datos.dart';
import 'package:flutter/material.dart';

class InputTextWidget extends StatelessWidget {
  
  final String? initialValue;

  const InputTextWidget({
    this.initialValue
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return  Container(

      width: size.width*0.57,
      height: size.height*0.04,

      child: TextFormField(

        initialValue: initialValue,
        readOnly: true,
        style: const TextStyle(fontSize: 14, color: Colors.black),
        decoration:InputDecorationsDatos.formInputDecorationDatos(),
        
      )

    );

  }

}