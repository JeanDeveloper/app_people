import 'package:apppeople/domain/helpers/get_image.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';


class FotoMaterialWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  final size = MediaQuery.of(context).size;
  
  return GestureDetector(
    onLongPress: ()async{

              await NDialog(
                
                dialogStyle: DialogStyle(
                  backgroundColor: Colors.grey,
                ),
                
                title: const Text('FOTO DE INGRESO', style:TextStyle(color: Colors.black), maxLines: 1, overflow: TextOverflow.ellipsis),
                
                content: Container(

                  margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  width: size.width*0.05,
                  height: size.height*0.35,
                                  
                  child:ClipRRect(

                    borderRadius: BorderRadius.circular(20),

                    child: FutureBuilder(
                      

                      future: getImage('https://cdn.pocket-lint.com/r/s/970x/assets/images/155087-laptops-review-microsoft-surface-laptop-go-review-image1-6ezitk9ymj.jpg'),

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

    child: Container(
  
        width: size.width*0.25,
        height: size.width*0.25,

        decoration: BoxDecoration(

          border: Border.all(
            width:2,
          ),
          borderRadius: BorderRadius.circular(20),

        ),
  
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: const Image(
        
            image: NetworkImage(
              'https://cdn.pocket-lint.com/r/s/970x/assets/images/155087-laptops-review-microsoft-surface-laptop-go-review-image1-6ezitk9ymj.jpg'
            ),
            
            fit: BoxFit.cover,
        
          ),
        ),
  
      ),
  );

  }
}