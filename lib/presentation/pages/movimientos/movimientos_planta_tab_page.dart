import 'package:apppeople/data/services/movimientos_services.dart';
import 'package:apppeople/domain/providers/radio_list_providers.dart';
import 'package:apppeople/presentation/pages/movimientos/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovimientosPlantasTabPage extends StatelessWidget {

  final int index;

  const MovimientosPlantasTabPage({
    Key? key, 
    required this.index, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

        
    return Column(

      children: [

        //se controlará dependiendo el tipo. mandara a llamar cuantos personal hay por tipo
        MovimientosListButton( index: index ),

        Expanded(child: MovimientosTilesPageBody())

      ],

    );
    
  }
  
}


class MovimientosTilesPageBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final radioListTile  = Provider.of<RadioListProvider>(context);
    final currentIndex   = radioListTile.valorTipoPersonaDentroPlanta;
    final movimientosListProvider = Provider.of<MovimientosProvider>(context, listen: false);

    switch (currentIndex) {

      case 0:
       
        return MovimientosTiles(movimientos: movimientosListProvider.getMovimientos('2774','1'));

      case 1:
       
        return MovimientosTiles(movimientos:movimientosListProvider.getMovimientos('2774', '1', tipoPersonal: '1'));

      case 2:
       
        return MovimientosTiles(movimientos: movimientosListProvider.getMovimientos('2774','1', tipoPersonal: '2'));

      case 3:
       
        return MovimientosTiles(movimientos: movimientosListProvider.getMovimientos('2774','1', tipoPersonal: '3'));

      case 4: 

        return MovimientosTiles(movimientos: movimientosListProvider.getMovimientos('2774','1', tipoPersonal: '4'));

      case 5:

        return MovimientosTiles(movimientos: movimientosListProvider.getMovimientos('2774','1', tipoPersonal: '5'));

      case 6:

        return MovimientosTiles(movimientos: movimientosListProvider.getMovimientos('2774','1', tipoPersonal: '6'));

      case 7:

        return MovimientosTiles(movimientos: movimientosListProvider.getMovimientos('2774','1', tipoPersonal: '7'));

      default:
       
        return MovimientosTiles(movimientos: movimientosListProvider.getMovimientos('2774','1'));

    }
    
  }

}