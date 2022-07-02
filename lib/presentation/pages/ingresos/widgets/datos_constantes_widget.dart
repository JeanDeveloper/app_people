import 'package:apppeople/domain/models/consulta_personal_model.dart';
import 'package:apppeople/domain/helpers/get_image.dart';
import 'package:apppeople/presentation/utils/styles.dart';
import 'package:apppeople/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';


class DatosConstantesWidget extends StatelessWidget {
  final ConsultaModel consulta;

  const DatosConstantesWidget({
    required this.consulta
  }) ;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(

      padding: EdgeInsets.symmetric(horizontal: size.width*0.0729, vertical: size.height*0.0116),
      width: double.infinity,
      height: size.height * 0.43,

      child: Column(

        children: [
          
          // FOTO
          FutureBuilder(

            future: getImage(consulta.img),

            builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {

              if(snapshot.hasData){

                return Container(
                  
                  width: size.width*0.33,
                  height: size.width*0.33,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: snapshot.data,
                
                );

              }else{
                return const CircularProgressIndicator();
              }
            }

          ),
          
          SizedBox(height: size.height*0.02),

          //CAMPO DNI
          Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [


              Text( (consulta.tipoDocumento=='DNI')? 'DNI:' : (consulta.tipoDocumento=='PASAPORTE')? 'PASAPORTE:': 'CARNET:', style: styleCrearPersonaltextForm()),
              InputTextWidget(initialValue: consulta.docPersona),

            ]

          ),
          SizedBox(height: size.height*0.02), 

          //CAMPO NOMBRE
          Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [

              Text('NOMBRE:  ', style: styleCrearPersonaltextForm()),
              InputTextWidget(initialValue: consulta.nombresPersona),

            ]

          ),
          SizedBox(height: size.height*0.02), 

          //CAMPO CARGO
          Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            
            children: [

              Text('CARGO:  ', style: styleCrearPersonaltextForm()),
              InputTextWidget(initialValue: consulta.cargo),
              
            ]

          ),
          SizedBox(height: size.height*0.02), 

          //CAMPO EMPRESA
          Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [

              Text('EMPRESA:  ', style: styleCrearPersonaltextForm()),
              InputTextWidget(initialValue: consulta.empresa)

            ]

          ),

        ],
        
      ),

    );

  }

}