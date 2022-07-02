import 'package:apppeople/domain/models/consulta_personal_model.dart';
import 'package:apppeople/presentation/pages/ingresos/widgets/widgets.dart';
import 'package:apppeople/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class IngresosTemplateBody extends StatelessWidget {

  final Widget bodyIngreso;

  final Function() funtionAccept;
  
  final ConsultaModel consulta;

  const IngresosTemplateBody({
    super.key, 
    required this.bodyIngreso, 
    required this.funtionAccept, 
    required this.consulta
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
  
    return SafeArea(

      child: Container(

        width: double.infinity,
        height: double.infinity,
        child: Stack(

          children: [
            
            SingleChildScrollView(

              child: Column(

                children: [

                  //WIDGET DE CAMPOS CONSTANTES.
                  DatosConstantesWidget(consulta: consulta),
                
                  //WIDGET DE CAMPOS DINAMICOS
                  bodyIngreso,
            
                ],

              ),
              
            ),
  
            //MENU INFERIOR
            Positioned(

              bottom: 0,

              child: FondoMenu(

                padding: EdgeInsets.symmetric(vertical: size.height*0.01),
                
                child: Row(
                  
                  mainAxisAlignment: MainAxisAlignment.center,
                  
                  children: [

                    ButtonMenu(
                      icon: Icons.accessibility_outlined, 
                      text: 'REGISTRAR',
                      onpressed: funtionAccept,
                    ),
 
                    SizedBox(width: size.width*0.09),
 
                    ButtonMenu(
                      icon: Icons.exit_to_app_outlined, 
                      text: 'SALIR',
                      onpressed: ()=> Navigator.pushNamed(context, 'home'),
                    ),

                  ],

                ),

              ),
            
            ),

          ],

        ),

      ),

    );

  }

}