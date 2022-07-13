import 'package:apppeople/domain/providers/movimientos_provider.dart';
import 'package:apppeople/presentation/pages/ingresos/widgets/widgets.dart';
import 'package:apppeople/presentation/pages/movimientos/widgets/app_bar.dart';
import 'package:apppeople/presentation/pages/movimientos/widgets/widgets.dart';
import 'package:apppeople/presentation/utils/search/search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class MovimientosPagev2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final searchProvider = Provider.of<MovimientosPageProvider>(context); 

    return Scaffold(

      appBar: appBarNoSearching(context, 'MOVIMIENTOS', ()=>showSearch(context: context, delegate: SearchDelegateProvider())),

      bottomNavigationBar: const CustomNavigationBar(),

      body: const _MovimientosPageBody(),

    );

  }

}

class _MovimientosPageBody extends StatelessWidget {

  const _MovimientosPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<MovimientosPageProvider>(context);
    final currentIndex = uiProvider.getSelectedMenuOpt; 

    switch (currentIndex) {

      case 0:
        return MovimientosPlantasTabPage(index: currentIndex);

      case 1:
        return MovimientosDiaTabPage(index: currentIndex);

      default:
        return MovimientosPlantasTabPage(index: currentIndex);

    }
    
  }

}