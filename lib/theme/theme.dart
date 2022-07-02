import 'package:flutter/material.dart';

class AppTheme {

  

  static final ThemeData lighTheme = ThemeData.light().copyWith(
    
    useMaterial3:true,
    
    primaryColor: const Color.fromARGB(249, 0, 2, 124),

    // unselectedWidgetColor:Colors.white,
    
    appBarTheme:  const AppBarTheme(
    
      backgroundColor: Color.fromARGB(249, 0, 2, 124),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
      centerTitle: true,
      
    ),
    

    // ESTILOS DE LOS TEXTOS
    textTheme: const TextTheme(

      headline1: TextStyle(
        fontSize: 25
      ),

      headline2: TextStyle(
        fontSize: 22
      ),

      headline3: TextStyle(
        fontSize: 17
      ),

      headline4: TextStyle(
        fontSize: 12
      )
    
    ),
    
    //ESTILOS DE LOS ICONOS
    primaryIconTheme: const  IconThemeData(
      color: Colors.white,
      size: 30
    ),

    iconTheme: const IconThemeData(
      color: Colors.white,
      size: 30
    ),


  );


}

