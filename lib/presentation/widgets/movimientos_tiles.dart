import 'package:apppeople/domain/helpers/get_responsive_text.dart';
import 'package:apppeople/domain/models/movimientos_model.dart';
import 'package:apppeople/domain/helpers/get_image.dart';
import 'package:apppeople/presentation/utils/styles.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';

class MovimientosTiles extends StatelessWidget {

  final Future<List<MovimientoModel>> movimientos;  

  MovimientosTiles({
    required this.movimientos, 
  });
  

  //IRA LA CONDICION SI VA HACER EL MOVIMIENTO DENTRO DE PLANTA O MOVIMIENTO DEL DIA

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(

      future: movimientos,

      builder: (BuildContext context, AsyncSnapshot<List<MovimientoModel>> snapshot) {


        if (snapshot.hasData){

          if (snapshot.data!.isEmpty){

            return Container(
              height: 400.0,
              
              child: const Center(
                child: Text('NO HAY MOVIMIMENTOS', style: TextStyle(color: Colors.black),),
              ),

            );

          }

          return ListView.separated(
            
            separatorBuilder: ( _ , int i) => const Divider(color: Colors.black, indent: 10, endIndent: 10),
            itemCount: snapshot.data!.length,
            itemBuilder: ( _, i) => _ListTileMovimiento( movimiento: snapshot.data![i] )
          
          );

        }else{

          return  Container(

            height: 400.0,
            child: const Center(child: CircularProgressIndicator(color: Colors.blue)),

          );

        }

      },

    );

  

  
  }


}


class _ListTileMovimiento extends StatelessWidget {

  final MovimientoModel movimiento;

  const _ListTileMovimiento({Key? key, required this.movimiento}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ListTile(
      style: ListTileStyle.list,

      leading: 
      Icon(Icons.account_circle, size: size.width*0.1, color: (movimiento.sexo == 'M')? Colors.blue :  Colors.pinkAccent),
      
      title: Row(

        children: [

          Container(
            width: size.width*0.40,
            child: AutoSizeText(movimiento.nombres!,style: styleLetterpersonalmovimientotitle(), overflow: TextOverflow.ellipsis, maxLines: 1)
          ),
          const SizedBox(width: 10),

          AutoSizeText(movimiento.dni!, style: styleLetterpersonalmovimientotitle())

        ],

      ),

      subtitle: Row(

        children: [
          
          Container(

            width: size.width*0.31,
            // height: size.height*0.058,
            // color: Colors.red,
            
            child: Column(
            
              crossAxisAlignment: CrossAxisAlignment.start,
            
              children: [
            
                AutoSizeText(movimiento.cargo!, minFontSize: 6,  maxFontSize: 12 ,style: styleLetterpersonalmovimientosubtitle(), overflow: TextOverflow.ellipsis, maxLines: 2),
                AutoSizeText(movimiento.empresa!, minFontSize: 4, maxFontSize: 12 , style: styleLetterpersonalmovimientosubtitle().copyWith(fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis, maxLines: 2,)
            
              ]
            
            ),

          ),

          SizedBox(width: size.width*0.03),


          IconButton(

            icon: Icon(Icons.camera_alt_outlined, size:  size.width*0.06,),

            onPressed: ()async{

              await NDialog(
                
                dialogStyle: DialogStyle(
                  backgroundColor: Colors.grey,
                ),
                
                title: Text('FOTO DE ${movimiento.nombres}', style: const TextStyle(color: Colors.black), maxLines: 1, overflow: TextOverflow.ellipsis),
                
                content: Container(

                  margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  width: size.width*0.05,
                  height: size.height*0.35,
                                  
                  child:ClipRRect(

                    borderRadius: BorderRadius.circular(20),

                    child: FutureBuilder(
                      

                      future: getImage(movimiento.pathImage),

                      builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) { 

                        if(snapshot.hasData){
                          
                          return Container(

                            child: snapshot.data,
                          
                          );


                        }else{

                          return const Center(child: CircularProgressIndicator());
                        }

                      }

                    )

                  )
              
                )

              ).show(context);

            }, 

          ),

          SizedBox(width: size.width*0.05),

          AutoSizeText( movimiento.fechaMovimiento!.toString().substring(11, 16), style: TextStyle(color: Colors.red, fontSize: size.width*0.03), minFontSize: 6, maxFontSize: 12,)

        ],

      ),

      trailing:  GestureDetector( 
        onTap: ()async{
          await NDialog(
            dialogStyle: DialogStyle(titleDivider: true, backgroundColor: Colors.white),
            title: const Text("Movimiento",  style: TextStyle(color: Colors.black)),
            content: const Text("¿Estas Seguro que quieres registar la salida?", style: TextStyle(color: Colors.black)),  
            actions: <Widget>[
              TextButton(child: const Text("Si"),onPressed: ()async{

                ProgressDialog progressDialog = ProgressDialog(context);

                progressDialog.setTitle(const Text("Cargando"));
                progressDialog.setMessage(const Text("Espere por Favor, Mientras se realiza la accion"));
                progressDialog.show();

                await Future.delayed(const Duration(seconds: 3));

                progressDialog.dismiss();

                Navigator.pushNamed(context, 'home');


              }),
              TextButton(child: const Text("No"),onPressed: ()=> Navigator.pop(context)),
            ],
          ).show(context);
        },
        child: Text('DAR SALIDA', style: TextStyle(color: Colors.green, fontSize: size.width*0.03))
      ),
      
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
    
    );
  }
}