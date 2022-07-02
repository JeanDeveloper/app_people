import 'package:apppeople/domain/providers/crear_personal_provider.dart';
import 'package:apppeople/domain/helpers/get_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ndialog/ndialog.dart';
import 'package:provider/provider.dart';

class ImageWidget extends StatelessWidget{

  final String? urlimage;

  ImageWidget({this.urlimage});

  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;
    final imageProvider = Provider.of<CrearPersonalProvider>(context);

    return FutureBuilder(

      future: getImage(urlimage),

      builder: (context,AsyncSnapshot<Widget> snapshot) {

        if(snapshot.hasData){

          return Stack(

            children: [
            
              Container(

                width: size.width*0.4,
                height: size.width*0.4,
                child: snapshot.data,
              
              ),

              Positioned(

                top:-10,
                right: -3,
                
                child: IconButton(

                  icon: Icon(Icons.camera_alt, color: Colors.black, size: size.width*0.1),
              
                  onPressed: () async {  

                    final picker = ImagePicker();

                    await NDialog(

                      dialogStyle: DialogStyle(titleDivider: true, backgroundColor: Colors.white),
                      title:  const Text("INFORMACION",  style: TextStyle(color: Colors.black)),
                      content:  const Text("Que accion desea hacer?", style: TextStyle(color: Colors.black)),
                      
                      actions: <Widget>[

                        TextButton(

                          child: const Text("Ir a Camara"),

                          onPressed: ()async{

                            final pickedFile = await picker.pickImage(
                              source: ImageSource.camera,
                              imageQuality: 100,
                            );

                            if (pickedFile == null){
                              print('no se selecciono nada');
                              Navigator.pop(context);

                              return;
                            }

                            print('Tenemos imagen ${ pickedFile.path }');

                            imageProvider.updateImage(pickedFile.path);

                            Navigator.pop(context);

                          }

                        ),

                        // TextButton(

                        //   child: const Text("Abrir Galeria"),

                        //   onPressed: ()async{

                        //     final pickedFile = await picker.pickImage(
                        //       source: ImageSource.gallery,
                        //       imageQuality: 100,
                        //     );

                        //     if (pickedFile == null){
                        //       print('no se selecciono nada');
                        //       return;
                        //     }

                        //     print('Tenemos imagen ${ pickedFile.path }');

                        //   }

                        // ),
                      
                      ],
                    
                    ).show(context);
                  },
                ),
              )        
            
            ],
          
          );

        }else{

          return const CircularProgressIndicator(color: Colors.blue);
        
        }
      
      },

    );

  }

}