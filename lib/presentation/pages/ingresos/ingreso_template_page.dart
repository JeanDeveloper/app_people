import 'package:apppeople/domain/models/consulta_personal_model.dart';
import 'package:apppeople/presentation/pages/ingresos/widgets/ingresos_template_body.dart';
import 'package:flutter/material.dart';

class IngresosTemplatePage extends StatelessWidget {

  String titleIngreso;
  Color colorAppBar;
  Widget body ;
  ConsultaModel consulta;
  Function() registrarFunction;


  IngresosTemplatePage({
    super.key, 
    required this.titleIngreso,
    required this.colorAppBar,
    required this.body,
    required this.registrarFunction,
    required this.consulta,
  });

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(

      child: Scaffold(
        
        appBar: AppBar(

          leading: IconButton(
            onPressed: ()=>Navigator.of(context).pop(), 
            icon: const Icon(Icons.arrow_back_ios, size: 30,)
          ),
          centerTitle: true,
          backgroundColor: colorAppBar,
          title: Text(titleIngreso, style: const  TextStyle(fontSize: 25, fontWeight: FontWeight.bold)) //dinamico,
        
        ),
    
         body: IngresosTemplateBody(bodyIngreso: body,funtionAccept: registrarFunction, consulta: consulta,), //dinamico
      ),

    );

  }


}