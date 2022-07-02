import 'package:apppeople/data/services/movimientos_services.dart';
import 'package:apppeople/domain/helpers/show_snackbar_awesome.dart';
import 'package:apppeople/domain/models/consulta_personal_model.dart';
import 'package:apppeople/domain/providers/ingreso_autorizado_provider.dart';
import 'package:apppeople/presentation/pages/ingresos/widgets/widgets.dart';
import 'package:apppeople/theme/theme.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:provider/provider.dart';


class IngresoAutorizadoPage extends StatelessWidget {

  const IngresoAutorizadoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        
    final consulta = ModalRoute.of(context)!.settings.arguments as ConsultaModel;

    return MultiProvider(

      providers: [
        ChangeNotifierProvider(create: ((context) => IngresoAutorizadoProvider())),
      ],
      
      child: IngresoAutorizadoBody(consulta: consulta),
    );

  }
  
}

class IngresoAutorizadoBody extends StatelessWidget {

  final ConsultaModel consulta;

  const IngresoAutorizadoBody({
    required this.consulta,
  });

  @override
  Widget build(BuildContext context) {

    return IngresosTemplatePage(

      titleIngreso: 'INGRESO AUTORIZADO', 
      colorAppBar: Colors.green, 
      body: IngresoAutorizadoWidget(consulta: consulta),
      consulta: consulta,
      registrarFunction: () async {

        await NDialog(
          
          dialogStyle: DialogStyle(titleDivider: true, backgroundColor: Colors.grey),
          title: const Text("¡Alerta!",),
          content: const Text(" ¿Estas seguro que deseas registrar el movimiento? ", style: TextStyle(color: Colors.black)),  
          
          actions: <Widget>[

            TextButton(

              child: const Text("SI"),

              onPressed: () async {

                final movimientoProvider = Provider.of<MovimientosProvider>(context, listen: false);
                CustomProgressDialog progressDialog = CustomProgressDialog(context,blur: 10);
                progressDialog.setLoadingWidget(CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(AppTheme.lighTheme.primaryColor)));
                progressDialog.show();

                // await Future.delayed(const Duration(seconds: 3));//metodo para guardar el movimiento.

                //TODO:funcion para registrar el movimiento.

                final idMovimiento = await movimientoProvider.registerMovimiento(consulta);

                print(idMovimiento);



                progressDialog.dismiss();

                // ignore: use_build_context_synchronously
                showSnackBarAwesome(context, 'EXITO', 'Se registro el movimiento para el personal ${consulta.docPersona} satisfactoriamente', ContentType.success);

                // ignore: use_build_context_synchronously
                Navigator.pushReplacementNamed(context, 'home');

              }

            ),

            TextButton(
            
              child: const Text("NO"),
              onPressed: () => Navigator.pop(context)
              
            ),


          ],

        ).show(context);

      },
      
    );

  }

}