import 'package:apppeople/domain/providers/login_global.dart';
import 'package:apppeople/domain/providers/numpad_provider.dart';
import 'package:apppeople/presentation/pages/home/widgets/widgets.dart';
import 'package:apppeople/presentation/widgets/widgets.dart';
import 'package:apppeople/theme/theme.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';


class HomePage extends StatelessWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MultiProvider(

      providers: [
        ChangeNotifierProvider(create:(context) => LoginGlobalProvider()),

      ],

      child: _HomePageState()
    );
    
  }
}

class _HomePageState extends StatelessWidget {

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
            Text('APP PEOPLE', style: AppTheme.lighTheme.textTheme.headline1 ),
      
            SizedBox(height: size.height*0.05),
      
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Bienvenido a: ', 
                style: AppTheme.lighTheme.textTheme.headline3?.copyWith(color: Colors.amber)
              ),
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
          icon: FontAwesomeIcons.user, 
          text: 'REGISTRAR',
          onpressed: ()=> Navigator.pushNamed(context, 'register') ,
        ),

        SizedBox(width: size.width*0.1),

        //MOVIMIENTOS
        ButtonMenu(
          icon: Icons.people_outline, 
          text: 'MOVIMIENTOS',
          onpressed: ()=>Navigator.pushNamed(context, 'movimientosv2'),
        ),

        SizedBox(width:  size.width*0.1),

        //SALIR
        ButtonMenu(
          icon: Icons.exit_to_app_outlined, 
          text: 'SALIR',
          onpressed: ()=>SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
        ),

      ],

    );

  }

}