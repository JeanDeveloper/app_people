import 'package:apppeople/domain/models/consulta_personal_model.dart';
import 'package:apppeople/domain/helpers/get_image.dart';
import 'package:apppeople/domain/helpers/show_dialog_register_personal.dart';
import 'package:apppeople/presentation/utils/styles.dart';
import 'package:apppeople/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';


class SalidaPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    final consulta = ModalRoute.of(context)!.settings.arguments as ConsultaModel;
    
    return Scaffold(

      appBar: AppBar(

        leading: IconButton(

          onPressed: ()=>Navigator.of(context).pop(), 
          icon: const Icon(Icons.arrow_back_ios)

        ),

        centerTitle: true,
        backgroundColor: const Color(0xffF57E25),//dinamico
        title: const Text('SALIDA AUTORIZADA', style:TextStyle(fontSize: 25, fontWeight: FontWeight.bold)) //dinamico,
      
      ),

      body:  SalidaPageBody(consulta: consulta,),

    );

  }

}

class SalidaPageBody extends StatelessWidget {

  final ConsultaModel consulta;

  const SalidaPageBody({
    required this.consulta,
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(

      width: double.infinity,
      height: double.infinity,

      child: Stack(

        children: [

           SalidaPageContent(consulta: consulta,),

          Positioned(

            bottom: 0,

            child: FondoMenu(
              padding: EdgeInsets.symmetric(vertical: size.height*0.02),
              
              child: Row(

                mainAxisAlignment: MainAxisAlignment.center,
                
                children: [
            
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(Icons.accessibility_outlined, color: Colors.white,size: size.width*0.06),
                        onPressed: (){
                          showMyDialog(context,  '!!! ATENCION !!!',' ¿Estas seguro que deseas registar el movimiento?',(){});
                        }, 
                      ),
                      Text('REGISTRAR',  style: textStyleLetter())
                    ],
                  ),
                
                  SizedBox(width: size.width*0.09),
            
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(Icons.exit_to_app_outlined, color: Colors.white, size: size.width*0.06),
                        onPressed: (){
                          Navigator.pushNamed(context, 'home');
                        },
                      ),
                      Text('SALIR',  style: textStyleLetter() ),
                    ],
                  )

                ],

              ),

            ),

          ),

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

class SalidaPageContent extends StatelessWidget {
  final ConsultaModel consulta;

  const SalidaPageContent({
    required this.consulta,
  });

  @override
  Widget build(BuildContext context) {
    

    final size = MediaQuery.of(context).size;

    return Container(

      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),

      child: Column(

        children: [

          //CAMPO FOTO
          FutureBuilder(

            future: getImage(consulta.img),

            builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {

              if(snapshot.hasData){

                return Container(
                  
                  width: size.width*0.33,
                  height: size.width*0.33,

                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(20)
                  ),

                  child: snapshot.data,
                );

              }else{
                return const CircularProgressIndicator();
              }

            },

          ),
          SizedBox(height: size.height*0.03),

          //CAMPO DNI
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Text('DNI:  ', style: styleCrearPersonaltextForm()),
              InputTextWidget(initialValue: consulta.docPersona,)

            ]
          ),
          SizedBox(height: size.height*0.02), 

          //CAMPO NOMBRES
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('NOMBRES:  ', style: styleCrearPersonaltextForm()),
              InputTextWidget(initialValue: consulta.nombresPersona)
            ]
          ),
          SizedBox(height: size.height*0.02), 

          //CAMPO CARGO
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('CARGO:  ', style: styleCrearPersonaltextForm()),
              InputTextWidget(initialValue: consulta.cargo,)
            ]
          ),
          SizedBox(height: size.height*0.02), 

          //CAMPO EMPRESA
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('EMPRESA:  ', style: styleCrearPersonaltextForm()),

              InputTextWidget(initialValue: consulta.empresa)



            ]
          ),
          SizedBox(height: size.height*0.03), 
          
          //SALIDA OTRO MATERIAL
          Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text('SALIDA OTRO MATERIAL :  ', style: styleCrearPersonaltextForm()),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Container(
                    width: size.width*0.35,
                    child: RadioListTile(
                      contentPadding: const EdgeInsets.all(0),
                      title: Text('GUIA', style: TextStyle(fontSize: size.width>500 ? 17 : 12, color: Colors.orange)),
                      value: 3, 
                      groupValue: 1, 
                      onChanged: (value){
                      },
                    ),
                  ),
                  
                  SizedBox(
                    width: size.width*0.3,
                    child: RadioListTile(
                      contentPadding: const EdgeInsets.all(0),
                      title: Text('MATERIAL DE VALOR', style: TextStyle(fontSize: size.width>500 ? 16 : 12, color: Colors.orange)),
                      value: 3, 
                      groupValue: 2,  
                      onChanged: (value){
                      },
                    ),
                  ),

                ],
              )


            ]
            
          ),
      
          //FOTO DE INGRESO Y FOTO DE SALIDA.
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Column(
                children: [
                  Text('FOTO DE INGRESO', style: styleCrearPersonaltextForm()),
                  SizedBox(height: size.height*0.01,),
                  FotoMaterialWidget(),
                ],
              ),

              Column(
                children: [
                  Text('FOTO DE SALIDA', style: styleCrearPersonaltextForm()),
                  SizedBox(height: size.height*0.01,),
                  FotoMaterialWidget(),
                ],
              )


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