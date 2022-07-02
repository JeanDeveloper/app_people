import 'package:flutter/material.dart';




List<DropdownMenuItem<String>> getListAutorizantes( String codautorizante, String autorizante ){

  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem( value: codautorizante, child: Text(autorizante)),
  ];
  return menuItems;
}





List<DropdownMenuItem<int>> get dropdownItemsAutorizantesDisponibles{

  List<DropdownMenuItem<int>> menuItems = [
    const DropdownMenuItem(value:123, child: Text('GLADYS SILVA')),
    const DropdownMenuItem(value:456, child: Text('ENRIQUE MORE')),
    const DropdownMenuItem(value:789, child:Text('ANITA LOPEZ')),
    const DropdownMenuItem(value:159, child:Text('MARCOS GONZALES')),
    const DropdownMenuItem(value:149, child: Text('LUIS MIGUEL')),
  ];
  
  return menuItems;
  
}



List<DropdownMenuItem<int>> get dropdownItemsMotivosDisponibles{

  List<DropdownMenuItem<int>> menuItems = [
    const DropdownMenuItem(value:1230, child: Text('REUNION')),
    const DropdownMenuItem(value:1234, child: Text('INGRESO PARA RECOGER ALGO')),
    const DropdownMenuItem(value:1235, child:Text('INGRESO POR TAL MOTIVO')),
    const DropdownMenuItem(value:1236, child:Text('ETC')),
  ];
  
  return menuItems;
}



List<DropdownMenuItem<int>> get dropdownItemsAreaAccesos{

  List<DropdownMenuItem<int>> menuItems = [
    const DropdownMenuItem(value:1230, child: Text('OF. ADMINISTRATIVAS')),
    const DropdownMenuItem(value:1231, child: Text('SISTEMAS')),
    const DropdownMenuItem(value:1232, child:Text('FINANZAS')),
    const DropdownMenuItem(value:1234, child:Text('OPERATIVA')),
  ];
  
  return menuItems;
}
