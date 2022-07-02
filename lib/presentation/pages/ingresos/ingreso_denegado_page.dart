import 'package:apppeople/domain/models/consulta_personal_model.dart';
import 'package:apppeople/presentation/pages/ingresos/widgets/widgets.dart';
import 'package:apppeople/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';


class IngresoDenegadoPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final consulta = ModalRoute.of(context)!.settings.arguments as ConsultaModel;
    
    return IngresosTemplatePage(

      titleIngreso: 'INGRESO DENEGADO', 
      colorAppBar: Colors.red, 
      body: IngresoDenegadoWidget(mensaje: consulta.mensaje),

      consulta:consulta,
      
      registrarFunction: ()async{

      print(consulta.nombresPersona);
        await NDialog(
          
          dialogStyle: DialogStyle(titleDivider: true, backgroundColor: Colors.grey),
          title: const Text("!Alerta!",),
          content: const Text(" ¿Quieres registrarlo de todas maneras? ", style: TextStyle(color: Colors.black)),  
          
          actions: <Widget>[
            TextButton(child: const Text("NO"),onPressed: () => Navigator.pop(context)),
            TextButton(child: const Text("SI"),onPressed: () async {
              
              CustomProgressDialog progressDialog = CustomProgressDialog(context,blur: 10);
              progressDialog.setLoadingWidget(CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(AppTheme.lighTheme.primaryColor)));
              progressDialog.show();

              await Future.delayed(const Duration(seconds: 3));

              progressDialog.dismiss();

              Navigator.pushNamed(context, 'ingreso_validado');

            }),
          ],

        ).show(context);




      },
    );
  }
}