import 'package:apppeople/domain/providers/radio_list_provider_consulta.dart';
import 'package:apppeople/presentation/pages/consultas/widgets/widgets.dart';
import 'package:apppeople/presentation/widgets/button_menu.dart';
import 'package:apppeople/presentation/widgets/fondo_menu.dart';
import 'package:apppeople/presentation/widgets/home_background.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ConsultaHomePage extends StatelessWidget {

  const ConsultaHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;
    final viewBotton  = MediaQuery.of(context).viewInsets.bottom;
  

    return MultiProvider(

      providers: [
        ChangeNotifierProvider(create:  ((context) =>  RadioListConsultaProvider())),

      ],
      
      child: Scaffold(
        
        body: Container(
    
          width: size.width,
          height: size.height,
          
          child: Stack(
    
            children:  [
    
              //FONDO
              const HomePageBackGround(),
    
    
              //FORMULARIO DE REGISTRO
              const FormConsulta(),
              
              //MENU BOTTOM
              Visibility(

                visible: (viewBotton==0) ? true: false,

                child: Positioned(
                
                  bottom: 0,
                  
                  child: FondoMenu(
                  
                  padding: EdgeInsets.symmetric(vertical: size.height*0.030 ),
                    
                    child: ButtonMenu(
                  
                      icon: FontAwesomeIcons.house,
                      text: 'INICIO', 
                  
                      onpressed:()=> Navigator.pushNamed(context, 'home'),
                  
                    ),
                
                  ),
                  
                ),

              ),
    
            ],
    
          ),
    
        ),
        
      ),

    );

  }
  
}