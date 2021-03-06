import 'package:apppeople/data/services/movimientos_services.dart';
import 'package:apppeople/domain/models/movimientos_model.dart';
import 'package:apppeople/domain/helpers/get_image.dart';
import 'package:apppeople/domain/providers/login_global.dart';
import 'package:apppeople/domain/repositories/validaciones/consutar_movimiento.dart';
import 'package:apppeople/presentation/utils/styles.dart';
import 'package:apppeople/theme/theme.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:provider/provider.dart';


class SearchDelegateProvider extends SearchDelegate{
  
  @override
  TextInputType? get keyboardType => TextInputType.number;


  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      textTheme: const TextTheme(
        headline6: TextStyle( color: Colors.white),
        
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppTheme.lighTheme.primaryColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.yellow.withOpacity(0.5)),
        border: InputBorder.none,
      ),
    );
  }

  @override
  String? get searchFieldLabel => 'Ingrese el numero de documento';

  @override
  TextStyle? get searchFieldStyle => const TextStyle(
    color: Colors.grey
  );


  @override
  List<Widget>? buildActions(BuildContext context) {
    return [

      IconButton(
        icon: const Icon(Icons.close),
        onPressed: ()=>query = '', 
      )

    ];

  }

  @override
  Widget? buildLeading(BuildContext context) {

    return IconButton(

      icon: const Icon(Icons.arrow_back_ios_new),
      onPressed: ()=> close(context, null),

    );

  }

  Widget _emptyContainer(){

    return const  Center(
      child: Icon(Icons.hourglass_empty_outlined, color: Colors.black38, size: 100),
    );

  }

  @override
  Widget buildResults(BuildContext context) {

    final searchProvider = Provider.of<MovimientosProvider>(context, listen: false);

    final size = MediaQuery.of(context).size;

    if ( query.isEmpty ){

      return _emptyContainer();
    
    }

    return FutureBuilder(

      future: searchProvider.getSearchMovimientos(query),
      
      builder: (context, AsyncSnapshot<List<MovimientoModel>> snapshot){

        if (!snapshot.hasData)return _emptyContainer();

        if(snapshot.data!.isEmpty ) return _emptyContainer();

        final movimientos = snapshot.data;

        return ListView.separated(

          separatorBuilder: ( _ , int i) => const Divider(color: Colors.black, indent: 10, endIndent: 10),
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: size.height*0.023, horizontal:size.width*0.024),
          itemCount: movimientos!.length,
          itemBuilder: (context, index) => _MovimientoTile(movimiento:movimientos[index]),

        );
  
      }
  
    );
  
  }

  @override
  Widget buildSuggestions(BuildContext context) {


    final searchProvider = Provider.of<MovimientosProvider>(context, listen: false);

    final size = MediaQuery.of(context).size;

    if ( query.isEmpty ){

      return _emptyContainer();
    
    }

    return FutureBuilder(

      future: searchProvider.getSearchMovimientos(query),
      
      builder: (context, AsyncSnapshot<List<MovimientoModel>> snapshot){

        if (!snapshot.hasData)return _emptyContainer();

        if(snapshot.data!.isEmpty ) return _emptyContainer();

        final movimientos = snapshot.data;

        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: size.height*0.023, horizontal:size.width*0.024),

          itemCount: movimientos!.length,
          itemBuilder: (context, index) => _MovimientoTile(movimiento:movimientos[index]),

        );
  
      }
  
    );

  }

}

class _MovimientoTile extends StatelessWidget {

  final MovimientoModel movimiento;

  const _MovimientoTile({required this.movimiento});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final globalProvider = Provider.of<LoginGlobalProvider>(context);
    
    return ListTile(

      style: ListTileStyle.list,
      contentPadding: EdgeInsets.symmetric(horizontal: size.height*0.0116),
      leading: Icon(Icons.account_circle, size: size.width*0.1, color: (movimiento.sexo == 'M')? Colors.blue :  Colors.pinkAccent),
      title: Row(

        children: [
        
          Container(
            width: size.width*0.40,
            child: AutoSizeText(movimiento.nombres!,style: styleLetterpersonalmovimientotitle(), overflow: TextOverflow.ellipsis, maxLines: 1,)
          ),        
          Text(movimiento.dni!, style: styleLetterpersonalmovimientotitle()),

        ],

      ),

      subtitle: Row(
        children: [

          Container(
        
            width: size.width*0.31,
            alignment: Alignment.topLeft,

            child: Column(
              
              crossAxisAlignment: CrossAxisAlignment.start,
              
              children: [
                AutoSizeText(movimiento.cargo!, minFontSize: 6,  maxFontSize: 12 , style: styleLetterpersonalmovimientosubtitle(), overflow: TextOverflow.ellipsis, maxLines: 2,),
                AutoSizeText(movimiento.empresa!, minFontSize: 4, maxFontSize: 12 , style: styleLetterpersonalmovimientosubtitle(), overflow: TextOverflow.ellipsis, maxLines: 3,)
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
                
                title: Text('FOTO DE ${movimiento.nombres}', style: const TextStyle(color: Colors.black)),
                
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

          AutoSizeText(movimiento.fechaMovimiento!.toString().substring(11, 16), style: TextStyle(color: Colors.red, fontSize: size.width*0.03), minFontSize: 6, maxFontSize: 12)
        
        ],
      ),
      
      trailing: (movimiento.fechaSalida == '')
        ? GestureDetector( 
          onTap: ()async{
            print(movimiento.fechaSalida);
            await NDialog(
              dialogStyle: DialogStyle(titleDivider: true, backgroundColor: Colors.white),
              title: const Text("Movimiento",  style: TextStyle(color: Colors.black)),
              content: const Text("??Estas Seguro que quieres registar la salida?", style: TextStyle(color: Colors.black)),  
              actions: <Widget>[
                TextButton(
                  child: const Text("Si"),
                  onPressed: ()async{

                    consultarMovimiento(context, movimiento.dni!, globalProvider.codServicio);

                  }
                ),
                TextButton(child: const Text("No"),onPressed: ()=> Navigator.pop(context)),
              ],
            ).show(context);
          },
          child: Text('DAR SALIDA', style: TextStyle(color: Colors.green, fontSize: size.width*0.03))
        )
        : null,


        



      
    );

  }
  
}


