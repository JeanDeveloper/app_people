import 'package:apppeople/domain/providers/movimientos_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<MovimientosPageProvider>(context);
    final currentIndex = uiProvider.getSelectedMenuOpt; 

    return BottomNavigationBar(

      backgroundColor: Colors.orange,
      fixedColor: Colors.white,
      iconSize: 30,
      currentIndex: currentIndex,
      onTap: (int index)=> uiProvider.setSelectedMenuOpt = index,

      items: const <BottomNavigationBarItem>[

        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'DENTRO DE LA PLANTA'
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.rule_sharp),
          label: 'MOVIMIENTOS DEL DIA'
        ),

      ]

    );


  }
}