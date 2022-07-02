import 'package:apppeople/domain/providers/crear_personal_provider.dart';
import 'package:apppeople/presentation/pages/personal/widgets/widgets.dart';
import 'package:apppeople/presentation/utils/styles.dart';
import 'package:apppeople/theme/theme.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CrearPersonalPage extends StatelessWidget {
  
  const CrearPersonalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final parameterPersonal = ModalRoute.of(context)!.settings.arguments ;

    return MultiProvider(

      providers: [
        ChangeNotifierProvider(create: ((context)=> CrearPersonalProvider())),
      ],

      child: SafeArea(

        child: Scaffold(

          appBar: AppBar(

            elevation: 0,
            titleSpacing: 20,
            backgroundColor: AppTheme.lighTheme.appBarTheme.backgroundColor,
            centerTitle: true,

            title: AutoSizeText('CREAR PERSONAL', style:styleCrearPersonalTitulo()),

            leading:  IconButton(
              
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
              onPressed: ()=> Navigator.pop(context),
              
            ),

          ),

          body: const CrearPersonalBody(),
         
        ),
      
      ),
    
    );
  
  }

}