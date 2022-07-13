import 'package:apppeople/domain/providers/ingreso_validado_provider.dart';
import 'package:apppeople/presentation/utils/dropdown_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class DropdownValidadoWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    final size = MediaQuery.of(context).size;
    final ingresoProvider = Provider.of<IngresoValidadoProvider>(context);


    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: size.width*0.57,
      height: size.height*0.05,
      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),

      ),
      alignment: Alignment.center,

      child: DropdownButtonFormField<int>(

        hint: const Text("Autorizantes ", style: TextStyle(fontSize: 15),),
        style: const TextStyle(color: Colors.blue,fontSize: 15),
        isExpanded: true,     
        items: dropdownItemsAutorizantesDisponibles, 
        onChanged: (value)=>ingresoProvider.autorizante=value!
      
      ),
    );
  }
}