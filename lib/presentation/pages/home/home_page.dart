import 'package:apppeople/presentation/pages/home/widgets/widgets.dart';
import 'package:apppeople/presentation/widgets/widgets.dart';
import 'package:apppeople/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;



    return Scaffold(

      body: Container(

        width: double.infinity,
        height: double.infinity,
        
        child: Stack(

          children:  [
    
            const HomePageBackGround(),

            const _HomeHeader(),

            const InformacionCliente(),

            Positioned(
              
              bottom: 0,

              //aqui debe tener el container que se expande con sus hijos.
              child: FondoMenu(

                padding: EdgeInsets.symmetric(vertical:size.height*0.035 ),
                child: const _IconMenu(),
              
              )

            ),
    
          ],

        ),

      ),

    );

  }

}

class _HomeHeader extends StatelessWidget {

  const _HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: double.infinity,
      height: 200,
      child: SafeArea(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Text('PEOPLE', style: AppTheme.lighTheme.textTheme.headline1 ),
      
            SizedBox(height: size.height*0.05),
      
            Align(
              alignment: Alignment.centerLeft,
              child: Text('BIENVENIDO A: ', style: AppTheme.lighTheme.textTheme.headline3?.copyWith(color: Colors.amber)),
            ),
      
            SizedBox(height: size.height*0.02),

          ],
      
        ),

      ),

    );
  }
}

class _IconMenu extends StatelessWidget {
  
  const _IconMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Row(

      mainAxisAlignment: MainAxisAlignment.center,

      children: [

        //REGISTRAR
        ButtonMenu(
          icon: FontAwesomeIcons.person, 
          text: 'REGISTRAR',
          onpressed: ()=> Navigator.pushNamed(context, 'register') ,
        ),

        SizedBox(width: size.width*0.1),

        //MOVIMIENTOS
        ButtonMenu(
          icon: FontAwesomeIcons.peopleGroup, 
          text: 'MOVIMIENTOS',
          onpressed: ()=>Navigator.pushNamed(context, 'movimientosv2'),
        ),

        SizedBox(width:  size.width*0.1),

        //CONSULTAR
        ButtonMenu(
          icon: FontAwesomeIcons.magnifyingGlass, 
          text: 'CONSULTAR',
          onpressed: ()=>Navigator.pushNamed(context, 'consulta_home'),
        ),

        SizedBox(width:  size.width*0.1),

        //SALIR
        ButtonMenu(
          icon: FontAwesomeIcons.arrowRightFromBracket, 
          text: 'SALIR',
          onpressed: ()=>SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
        ),

      ],

    );

  }

}