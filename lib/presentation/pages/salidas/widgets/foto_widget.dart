import 'package:apppeople/presentation/pages/salidas/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FotoWidgetSalidaPage extends StatelessWidget {

  final bool? onlyShow ;
  
  final String? urlimage;

  const FotoWidgetSalidaPage({
    super.key, 
    this.onlyShow = true, 
    this.urlimage,
  });


  @override
  Widget build(BuildContext context) {

    //PROVEEDOR QUE CONTROLARÁ LA IMAGEN DE ENTRADA
    // final personalProvider = Provider.of<CrearPersonalProvider>(context, listen: false);
    
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      
      borderRadius:  BorderRadius.circular(25),

      child: Container(
    
        width: size.width*0.3,
        height: size.width*0.3,
        
        child: Stack(
    
          children: [
    
            //FOTO
            Container(
              width: double.infinity,
              height: size.height*0.5,

              // child: ImageSalidaPage(urlimage:(personalProvider.foto==null)? null : personalProvider.foto!.path ),

              child : ImageSalidaPage(urlimage: urlimage, onlyShow: onlyShow)
            
            ),  
            (onlyShow != true)
              ? 
                //CAMARA
                Positioned(
                  
                  top: 0,
                  right: size.width*0.01,
        
                  child: IconButton(  
        
                    icon:Icon(Icons.camera_alt, color: Colors.white, size: size.width*0.1),
        
                    onPressed: () async {  
        
                      final picker = ImagePicker();

                      final pickedFile = await picker.pickImage(

                        source: ImageSource.camera,
                        imageQuality: 100,

                      );

                      if ( pickedFile == null ){

                        Navigator.pop(context);
                        return;

                      }

                      // personalProvider.updateImage(pickedFile.path);

                      Navigator.pop(context);

                    
                    },
                    
                  ),
        
                )
              : Container(),
    
          ],
    
        ),
    
      ),

    );
  
  }

}