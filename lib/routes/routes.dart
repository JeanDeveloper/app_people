import 'package:flutter/material.dart';
import 'package:apppeople/presentation/pages/pages.dart';

class AppRoutes {
  static const initialRoute = 'home';
  static Map <String, Widget Function(BuildContext)> getAppRoutes(){
    Map <String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({
      'home':   (BuildContext context ) => const HomePage(),
      'register' : (BuildContext context ) => const RegisterPage(),
      'movimientos' :(BuildContext context) => MovimientosPage(),
      'crear_personal' : (BuildContext context) => const CrearPersonalPage(),
      'ingreso_autorizado' : (BuildContext context) => IngresoAutorizadoPage(),
      'ingreso_validado' : (BuildContext context) => IngresoValidadoPage(),
      'ingreso_denegado' : (BuildContext context) => IngresoDenegadoPage(),
      'consultas' : (BuildContext context) => ConsultaPage(),
      'loading' : (BuildContext context) => const LoadingPage(),
      'salida_autorizada' : (BuildContext context) => SalidaPage(),
      'login' : ( BuildContext context )  => const LoginPage(),
      'movimientosv2' : ( BuildContext context )  =>MovimientosPagev2(),

    });
    return appRoutes;
  }
}