import 'package:apppeople/domain/providers/radio_list_provider_consulta.dart';
import 'package:apppeople/presentation/pages/consultas/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormConsulta extends StatelessWidget {

  const FormConsulta({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    final size = MediaQuery.of(context).size;
    final tipoProvider = Provider.of<RadioListConsultaProvider>(context);

    return Container(

      margin: const EdgeInsets.all(15),
      width: size.width,
      height: size.height,
      alignment: Alignment.center,

      child: SingleChildScrollView(

        keyboardDismissBehavior:  ScrollViewKeyboardDismissBehavior.onDrag,


      
        child: Column(
        
          children: [
      
            const TipoCarnetConsulta(),
            SizedBox(height: size.height*0.05),
      
            if(tipoProvider.getValorTipoDocumento==1)
              const DNIFormConsulta(),
            
            if(tipoProvider.getValorTipoDocumento==2)
              const CarnetFormConsulta(),
            
            if(tipoProvider.getValorTipoDocumento==3)
              const PasaporteFormConsulta(),
        
          ],
        
        ),
      
      ),

    );


  }
}