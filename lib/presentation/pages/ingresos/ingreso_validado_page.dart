import 'package:apppeople/domain/models/consulta_personal_model.dart';
import 'package:apppeople/domain/providers/ingreso_validado_provider.dart';
import 'package:apppeople/presentation/pages/ingresos/widgets/widgets.dart';
import 'package:apppeople/theme/theme.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:provider/provider.dart';

class IngresoValidadoPage extends StatelessWidget {


  const IngresoValidadoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MultiProvider(

      providers: [
        ChangeNotifierProvider(create: (BuildContext context)=> IngresoValidadoProvider())
      ],

      child: IngresosTemplatePage(
        consulta: ConsultaModel(
        codigoClienteControl: 0, 
        codigoServicio: 0, 
        resultado: '',
      ),

        titleIngreso: 'INGRESO VALIDADO', 
        colorAppBar: Colors.purpleAccent, 
        body: const IngresoValidadoWidget(),

        registrarFunction: ()async{
          
          await NDialog(
          
            dialogStyle: DialogStyle(titleDivider: true, backgroundColor: Colors.grey),
            title: const Text("!Alerta!",),
            content: const Text(" ¿Estas seguro que deseas registrar? ", style: TextStyle(color: Colors.black)),  
            
            actions: <Widget>[
              TextButton(child: const Text("NO"),onPressed: () => Navigator.pop(context)),
              TextButton(child: const Text("SI"),onPressed: () async {
                CustomProgressDialog progressDialog = CustomProgressDialog(context,blur: 10);
                progressDialog.setLoadingWidget(CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(AppTheme.lighTheme.primaryColor)));
                progressDialog.show();

                await Future.delayed(const Duration(seconds: 3));

                progressDialog.dismiss();

                Navigator.pop(context);

                final snackBar = SnackBar(

                  elevation: 0,
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.transparent,
                  
                  content: AwesomeSnackbarContent(
                    
                    title: 'EXITO',
                    message:
                        'El movimiento se ha registrado correctamente',
                    contentType: ContentType.success,
                  ),
                );
                
                ScaffoldMessenger.of(context).showSnackBar(snackBar);

                Navigator.pushNamed(context, 'home');


              }),
            ],

          ).show(context);



        },

      ),

    );

  }
  
}