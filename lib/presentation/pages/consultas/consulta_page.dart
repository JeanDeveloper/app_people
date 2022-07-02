import 'package:apppeople/presentation/utils/dropdown_item.dart';
import 'package:apppeople/presentation/utils/styles.dart';
import 'package:apppeople/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';


class ConsultaPage extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: ()=>Navigator.of(context).pop(), 
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white,)
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff1E2971),
        title: const Text('CONSULTA', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))
      ),
      body: const _ConsultaPageBody(),

  );
  }
}

class _ConsultaPageBody extends StatelessWidget {

  const _ConsultaPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

      child: Column(
        children: [
          SizedBox(height: size.height*0.05),
          // FotoAvatarWidget(onPressed: (){}, radius: 50),
          _ContainerEstado(size: size, text: 'INGRESO',),
          SizedBox(height: size.height*0.05),

          //CAMPO DNI
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('DNI:', style: styleCrearPersonaltextForm()),
              Container(
                width: size.width*0.57,
                height: size.height*0.04,
                child: TextFormField(
                  initialValue: '76216238',//dinamico
                  readOnly: true,
                  style: const TextStyle(fontSize: 15, color: Colors.black),
                  decoration:_inputDecorationDatos() ,
                )
              )
            ]
          ),
          SizedBox(height: size.height*0.02), 

          //CAMPO NOMBRES
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('NOMBRES:  ', style: styleCrearPersonaltextForm()),
              Container(
                width: size.width*0.57,
                height: size.height*0.04,
                child: TextFormField(
                  initialValue: 'LUIS ALBERTO MORALES', //dinamico
                  readOnly: true,
                  style: const TextStyle(fontSize: 15, color: Colors.black),
                  decoration:_inputDecorationDatos() ,
                )

              )
            ]
          ),
          SizedBox(height: size.height*0.02), 

          //CAMPO CARGO
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('CARGO:  ', style: styleCrearPersonaltextForm()),
              Container(
                width: size.width*0.57,
                height: size.height*0.04,
                child: TextFormField(
                  initialValue:  "OPERARIO", //DINAMICO
                  readOnly: true,
                  style: const TextStyle(fontSize: 15, color: Colors.black),
                  decoration:_inputDecorationDatos() ,
                )
              )
            ]
          ),
          SizedBox(height: size.height*0.02), 

          //CAMPO EMPRESA
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('EMPRESA:  ', style: styleCrearPersonaltextForm()),

              Container(
                width: size.width*0.57,
                height: size.height*0.04,
                // color:Colors.red,

                child: TextFormField(
                  initialValue: 'SOLMAR SECURITY SAC', //dinamico
                  readOnly: true,
                  style: const TextStyle(fontSize: 15, color: Colors.black),
                  decoration:_inputDecorationDatos() ,
                )

              )

            ]
          ),
          SizedBox(height: size.height*0.02), 

          //CAMPO AUTORIZANTE
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
  
            children: [
  
              Text('AUTORIZANTE:  ', style: styleCrearPersonaltextForm()),


              DropdownButtonWidget(

                items: dropdownItemsAutorizantesDisponibles, 
                hintText: 'AUTORIZANTES DISPONIBLES', 
                onchanged: (value){}
                
              ),

            ],
          ),
          SizedBox(height: size.height*0.02), 

          //CAMPO MOTIVO
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
  
            children: [
  
              Text('MOTIVO:  ', style: styleCrearPersonaltextForm()),

              DropdownButtonWidget(

                items: dropdownItemsMotivosDisponibles, 
                hintText: 'MOTIVOS DISPONIBLES', 
                onchanged: (value){}
                
              ),

            ],
          ),
          SizedBox(height: size.height*0.02), 

          //CAMPO ACCESO
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
  
            children: [
  
              Text('AREA DE ACCESSO:  ', style: styleCrearPersonaltextForm().copyWith(fontSize: 13)),
              
              DropdownButtonWidget(

                items: dropdownItemsAreaAccesos, 
                hintText: 'ACCESO DISPONIBLES', 
                onchanged: (value){}
                
              ),

            ],
          ),
          SizedBox(height: size.height*0.02), 

          //CAMPO SERIE
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('SERIE:  ', style: styleCrearPersonaltextForm()),
              Container(
                width: size.width*0.57,
                height: size.height*0.04,
                child: TextFormField(
                  initialValue: '616351561516463',//dinamico
                  readOnly: true,
                  style: const TextStyle(fontSize: 15, color: Colors.black),
                  decoration:_inputDecorationDatos() ,
                )
              )
            ]
          ),
          SizedBox(height: size.height*0.03), 

          Column(

            children: [
              Text('FOTO INGRESO', style:styleCrearPersonaltextForm().copyWith(fontSize: 13)),
              SizedBox(height: size.height*0.01), 
              FotoMaterialWidget(),
            ],

          )


        ],

      ),

    );

  }

  InputDecoration _inputDecorationDatos()=> const  InputDecoration(

    enabledBorder:  OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(
        color: Colors.black
      )
    ),

    focusedBorder:  OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(
        color: Colors.black
      )
    ),

  );
}

class _ContainerEstado extends StatelessWidget {
  const _ContainerEstado({
    Key? key,
    required this.size, 
    required this.text,
  }) : super(key: key);

  final Size size;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height*0.03,
      width: size.width*0.3,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(50)

      ),
      alignment: Alignment.center,
      child: const Text('INGRESO', style: TextStyle(color: Colors.white),),
    );
  }
}

