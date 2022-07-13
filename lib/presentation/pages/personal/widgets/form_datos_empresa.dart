import 'package:apppeople/data/services/cargos_service.dart';
import 'package:apppeople/data/services/empresas_service.dart';
import 'package:apppeople/domain/providers/crear_personal_provider.dart';
import 'package:apppeople/domain/providers/login_global.dart';
import 'package:apppeople/presentation/pages/personal/widgets/widgets.dart';
import 'package:apppeople/presentation/utils/styles.dart';
import 'package:apppeople/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class FormDatosEmpresa extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;
    final personalProvider = Provider.of<CrearPersonalProvider>(context);
    final globalProvider   = Provider.of<LoginGlobalProvider>(context);


    personalProvider.initEmpresas(globalProvider.codCliente, '');
    personalProvider.initCargos('', globalProvider.codCliente);

    return Form(

      key: personalProvider.formKeys[1],
      
      child: Column(
          
        children: [
          
          _SexoRegister(),
          SizedBox(height: size.height*0.04), 

          //CAMPO PARA EL TIPO DE PERSONA DROPDOWNBUTTON
          Row(
          
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
      
            children: [
      
              Text('TIPO PERSONA:  ', style: styleCrearPersonaltextForm()),
      
      
              DropdownButtonPersonal(
      
                items: dropdownItemsTipoPersona,
                hintText: 'SELECCIONE EL TIPO PERSONA',
                onchanged: (value)=>personalProvider.tipoPersona = value!,
      
                onvalidator: (value) {
                
                  return (value!= null)
                  ? null
                  : "Por favor complete este campo";
                  
                },
      
              ),
          
            ],
          
          ),
          SizedBox(height: size.height*0.04), 

          //CAMPO PARA EL PRIMER NOMBRE
          Row(
          
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
            children: [
      
              Text('NOMBRE:  ', style: styleCrearPersonaltextForm()),
          
              Container(
          
                width: size.width*0.57,
          
                child: TextFormField(
      
                  textCapitalization: TextCapitalization.characters,
      
                  onChanged: (value)=>personalProvider.pNombre=value,
          
                  
                  style: TextStyle(fontSize: size.width*0.030, color: Colors.black),
                  decoration:inputDecorationDatos() ,
                )
          
              )
          
            ]
          ),
          SizedBox(height: size.height*0.04), 

          //CAMPO PARA EL SEGUNDO NOMBRE              
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
      
              Text('S. NOMBRE:  ', style: styleCrearPersonaltextForm()),
              
              Container(
                width: size.width*0.57,
          
                child: TextFormField(
      
                  textCapitalization: TextCapitalization.characters,
                  cursorHeight: 20,
                  style: TextStyle(fontSize: size.width*0.030, color: Colors.black),
                  decoration:inputDecorationDatos(),
                  onChanged: (value)=> personalProvider.sNombre=value,
      
                )
          
              )
            
            ]
          ),
          SizedBox(height: size.height*0.04), 
      
          //CAMPO PARA EL PRIMER APELLIDO
          Row(
      
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
      
            children: [
      
              Text('APELLIDO:  ', style: styleCrearPersonaltextForm()),
      
              Container(
      
                width: size.width*0.57,
                // height: size.height*0.04,
      
                child: TextFormField(
                  textCapitalization: TextCapitalization.characters,
           
                  cursorHeight: 20,
                  style:  TextStyle(fontSize: size.width*0.030, color: Colors.black),
                  decoration:inputDecorationDatos() ,
                  onChanged: (value)=>personalProvider.pApellido=value,
                )
      
              )
            
            ]
      
          ),
          SizedBox(height: size.height*0.04), 
      
          //CAMPO PARA EL SEGUNDO APELLIDO
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
      
              Text('S. APELLIDO:  ', style: styleCrearPersonaltextForm()),
              Container(
                width: size.width*0.57,
                // height: size.height*0.04,
                child: TextFormField(
                  textCapitalization: TextCapitalization.characters,
          
                  cursorHeight: 20,
                  style:  TextStyle(fontSize:size.width*0.030, color: Colors.black),
                  decoration:inputDecorationDatos(),
                  onChanged: (value)=> personalProvider.sApellido=value,
      
                )
              )
            
            ]
          ),
          SizedBox(height: size.height*0.04), 
          
          //CAMPO PARA LA EMPRESA
          Row(
      
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
      
            children: [
      
              Text('EMPRESA: ', style: styleCrearPersonaltextForm()),

              (personalProvider.itemsEmpresas.isNotEmpty)
                // ?const Center(child:  CircularProgressIndicator())

                ? DropdownButton2Widget(
                  items: personalProvider.itemsEmpresas,
                  hinText: 'SELECCIONE LA EMPRESA',
                  hintTextForm: 'Busque la empresa',
                  onchanged: (value)=>personalProvider.empresa = value!,
                  texteditingcontroller: personalProvider.searchEditingControllerEmpresa,
                  value: personalProvider.empresa,
                  ) 
                : const Center(child:  CircularProgressIndicator()),
      
            ]
      
          ),
          SizedBox(height: size.height*0.04), 
          
          //CAMPO PARA EL CARGO
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            
            children: [
      
              Text('CARGO: ', style: styleCrearPersonaltextForm()),

              (personalProvider.itemsCargos.isNotEmpty)
                ? DropdownButton2Widget(
                  items: personalProvider.itemsCargos,
                  hinText: 'SELECCIONE EL CARGO',
                  hintTextForm: 'Busque el cargo',
                  onchanged: (value)=>personalProvider.cargo = value!,
                  texteditingcontroller: personalProvider.searchEditingControllerCargo,
                  value: personalProvider.cargo,
                  ) 
                : const Center(child:  CircularProgressIndicator()),
      
            ]

          ),
          SizedBox(height: size.height*0.04), 
          
        ],
          
      ),
      
    );

  }

  
}

class _SexoRegister extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final personalProvider = Provider.of<CrearPersonalProvider>(context);    

    return Container(

      width: double.infinity,
      // color: Colors.red,
      
      child: Row(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [

          Text('SEXO: ', style: styleCrearPersonaltextForm()),

          DropdownButtonPersonal(

            hintText: 'SELECCIONE EL SEXO',

            onvalidator: (value) {
            
              return (value!= null)
              ? null
              : "Por favor complete este campo";
              
            },
            
            items: dropdownItemSexo, 
            onchanged: (value)=> personalProvider.valorSexo = value!,

          ),


        ]

      ),
    
    );

  }

}

List<DropdownMenuItem<int>> get dropdownItemsTipoPersona{

  List<DropdownMenuItem<int>> menuItems = [
    
    const DropdownMenuItem(value:1, child: Text('PROPIO')),
    const DropdownMenuItem(value:2, child: Text('TERCERO')),
    const DropdownMenuItem(value:3, child:Text('VISITA')),
    const DropdownMenuItem(value:4, child: Text('CLIENTES')),
    const DropdownMenuItem(value:5, child:Text('AUTORIDAD')),
    const DropdownMenuItem(value:6, child:Text('CLIENTE IMPORTACION')),
    const DropdownMenuItem(value:7, child:Text('CLIENTE EXPORTACION')),

  ];

  return menuItems;

}

List<DropdownMenuItem<int>> get dropdownItemsEmpresas{

  List<DropdownMenuItem<int>> menuItems = [
    const DropdownMenuItem(value:1, child: Text('SOLMAR SECURITY SAC')),
    const DropdownMenuItem(value:2, child: Text('TASA ')),
    const DropdownMenuItem(value:3, child:Text('GRUPO VALERO SAC')),
    
  ];

  return menuItems;

}

List<DropdownMenuItem<int>> get dropdownItemsCargo{

  List<DropdownMenuItem<int>> menuItems = [
    const DropdownMenuItem(value:1, child: Text('OPERADOR')),
    const DropdownMenuItem(value:2, child: Text('GERENTE')),
    const DropdownMenuItem(value:3, child:Text('SOCIO')),
  ];

  return menuItems;

}

