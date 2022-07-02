import 'package:apppeople/presentation/utils/styles.dart';
import 'package:flutter/material.dart';

class ListTilePersona extends StatelessWidget {
  const ListTilePersona({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ListTile(
      leading: Icon(Icons.account_circle, color: Colors.blue, size: size.width*0.1),
      title: Row(
        children: [
          Text('MELVIN HUAYANAY VALERIO',style: styleLetterpersonalmovimientotitle(), ),
          Text(' - ', style: styleLetterpersonalmovimientotitle()),
          Text('46926463', style: styleLetterpersonalmovimientotitle())
        ],
      ),
      subtitle: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Jefe de Operaciones', style: styleLetterpersonalmovimientosubtitle()),
              Text('SOLMAR SECURITY S.A.C', style: styleLetterpersonalmovimientosubtitle())
            ]
          ),

          SizedBox(width: size.width*0.03),

          IconButton(
            icon: Icon(Icons.camera_alt_outlined, size:  size.width*0.06,),
            onPressed: (){}, 
          ),


          SizedBox(width: size.width*0.05),


          Text('08:10', style: TextStyle(color: Colors.red, fontSize: size.width*0.03))



        ],
      ),
      trailing: Text('DAR SALIDA', style: TextStyle(color: Colors.green, fontSize: size.width*0.03),),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
    );
    
  }
}