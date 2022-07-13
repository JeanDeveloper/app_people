import 'package:apppeople/data/services/movimientos_services.dart';
import 'package:apppeople/domain/helpers/show_snackbar_awesome.dart';
import 'package:apppeople/domain/models/consulta_personal_model.dart';
import 'package:apppeople/domain/providers/areas_provider.dart';
import 'package:apppeople/domain/providers/autorizantes_provider.dart';
import 'package:apppeople/domain/providers/ingreso_validado_provider.dart';
import 'package:apppeople/domain/providers/motivo_provider.dart';
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
    
    final consulta = ModalRoute.of(context)!.settings.arguments as ConsultaModel;

    return MultiProvider(

      providers: [

        ChangeNotifierProvider(create: (BuildContext context)=> IngresoValidadoProvider()),
        ChangeNotifierProvider(create: (BuildContext context)=> AutorizanteProvider()),
        ChangeNotifierProvider(create: (BuildContext context)=> MotivoProvider()),
        ChangeNotifierProvider(create: (BuildContext context)=> AreasProvider()),

      ],

      child: IngresoValidadoBody(consulta: consulta),

    );

  }
  
}

class IngresoValidadoBody extends StatelessWidget {
  
  final ConsultaModel consulta;
  
  const IngresoValidadoBody({
    Key? key, 
    required this.consulta,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IngresosTemplatePage(
      titleIngreso: 'INGRESO VALIDADO', 
      colorAppBar: Colors.purpleAccent, 
      body:  IngresoValidadoWidget(consulta:consulta),
      consulta: consulta,

      registrarFunction: ()async{
        
        await NDialog(
        
          dialogStyle: DialogStyle(titleDivider: true, backgroundColor: Colors.grey),
          title: const Text("!Alerta!",),
          content: const Text(" ¿Estas seguro que deseas registrar? ", style: TextStyle(color: Colors.black)),  
          
          actions: <Widget>[


            TextButton(
              child: const Text("SI"),
              onPressed: () async {

                final movimientoProvider = Provider.of<MovimientosProvider>(context, listen: false);
                CustomProgressDialog progressDialog = CustomProgressDialog(context,blur: 10);
                progressDialog.setLoadingWidget(CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(AppTheme.lighTheme.primaryColor)));
                progressDialog.show();

                final idMovimiento = await movimientoProvider.registerMovimiento(consulta);
                print(idMovimiento);
                progressDialog.dismiss();

                // ignore: use_build_context_synchronously
                showSnackBarAwesome(context, 'EXITO', 'Se registro el movimiento para el personal ${consulta.docPersona} con exito', ContentType.success);

                // ignore: use_build_context_synchronously
                Navigator.pushReplacementNamed(context, 'home');

              },
              

            ),
            TextButton(child: const Text("NO"),onPressed: () => Navigator.pop(context)),

            
          ],

        ).show(context);



      },

    );
  }
}