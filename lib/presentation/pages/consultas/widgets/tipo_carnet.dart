import 'package:apppeople/domain/providers/radio_list_provider_consulta.dart';
import 'package:apppeople/theme/theme.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TipoCarnetConsulta extends StatelessWidget {
  
  const TipoCarnetConsulta({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final tipoProvider = Provider.of<RadioListConsultaProvider>(context);

    return Container(
      padding: const EdgeInsets.all(10),
      alignment: Alignment.topCenter,
      width: double.infinity,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          // radio de dni, por defecto esta encendido
          SizedBox(
            width: size.width*0.25,
            child: RadioListTile<int>(
              
              activeColor: Colors.white,
              contentPadding: const EdgeInsets.all(0),
              value:1, 
              groupValue: tipoProvider.getValorTipoDocumento, 
              onChanged: (value){
                tipoProvider.setValorTipoDocumento=value! ;
              },
              title: AutoSizeText('DNI', style:AppTheme.lighTheme.textTheme.headline3),
            ),
          ),

          // radio de extranjeria
          SizedBox(
            width: size.width*0.25,
            child: RadioListTile<int>(
              activeColor: Colors.white,
              contentPadding: const EdgeInsets.all(0),
              value: 2, 
              groupValue: tipoProvider.getValorTipoDocumento, 
              onChanged: (value){
                tipoProvider.setValorTipoDocumento=value! ;
              },
              title: AutoSizeText('CE', style: AppTheme.lighTheme.textTheme.headline3),
            ),
          ),

          // radio de pasaporte
          SizedBox(
            width: size.width*0.35,
            child: RadioListTile<int>(
              value: 3, 
              groupValue: tipoProvider.getValorTipoDocumento, 
              activeColor: Colors.white,
              contentPadding: const EdgeInsets.all(0),
              title: AutoSizeText('PASAPORTE', style: AppTheme.lighTheme.textTheme.headline3),
              onChanged: (value){
                tipoProvider.setValorTipoDocumento=value!;
              },
            ),
          ),

        ],
      
      ),

    );


  }
}