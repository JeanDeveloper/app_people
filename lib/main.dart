import 'package:apppeople/data/services/movimientos_services.dart';
import 'package:apppeople/domain/providers/login_provider.dart';
import 'package:apppeople/domain/providers/movimientos_provider.dart';
import 'package:apppeople/domain/providers/numpad_provider.dart';
import 'package:apppeople/domain/providers/radio_list_providers.dart';
import 'package:apppeople/domain/providers/register_form_provider.dart';
import 'package:apppeople/routes/routes.dart';
import 'package:apppeople/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';


void main() {

  runApp(const MyApp());
  
}


class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return MultiProvider(

      providers: [

        ChangeNotifierProvider(create: ((context)=> RegisterFormProvider())),
        ChangeNotifierProvider(create: ((context)=> LoginProvider())),
        ChangeNotifierProvider(create: ((context)=> MovimientosProvider())),
        ChangeNotifierProvider(create: ((context)=> MovimientosPageProvider())),
        ChangeNotifierProvider(create: ((context)=> RadioListProvider())),      
        ChangeNotifierProvider(create: ((context)=> NumPadProvider())),

      ],  

      child: MaterialApp(
        
        debugShowCheckedModeBanner: false,
        title: 'App People',
        theme: AppTheme.lighTheme,
        routes: AppRoutes.getAppRoutes(),
        initialRoute: 'login',
    
      ),
      
    );

  }

}

