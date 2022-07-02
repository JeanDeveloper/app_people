import 'package:apppeople/domain/providers/crear_personal_provider.dart';
import 'package:apppeople/presentation/utils/styles.dart';
import 'package:apppeople/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CrearPersonalForm extends StatelessWidget {

  const CrearPersonalForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final personalProvider = Provider.of<CrearPersonalProvider>(context);
    
    return Container(

      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),

      child: Form(

        child: SingleChildScrollView(

          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [

              //CAMPO PARA EL TIPO DE PERSONA DROPDOWNBUTTON
              Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
                children: [
        
                  Text('TIPO PERSONA:  ', style: styleCrearPersonaltextForm()),
        
                  DropdownButtonWidget(

                    items: dropdownItemsTipoPersona, 
                    hintText: 'TIPO DE PERSONA', 
                    onchanged: (value)=>personalProvider.tipoPersona = value!
                  
                  )

                ],

              ),
        
              SizedBox(height: size.height*0.02),

              //CAMPO PARA EL TIPO DE DOCUMENTO (DROPDOWNBUTTON)
              Row(
                
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
                children: [
        
                  Text('TIPO DOCUMENTO:  ', style: styleCrearPersonaltextForm()),

                  DropdownButtonWidget(
                    items: dropdownItemsTipoDocumento, 
                    hintText: 'TIPO DE DOCUMENTO', 
                    onchanged:(value) =>personalProvider.tipoDocumento = value!
                  ),

                ],
        
              ),
            
              SizedBox(height: size.height*0.02), 

              //CAMPO PARA EL NUMERO DEL DOCUMENTO
              Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                
                children: [
        
                  Text('N° DOCUMENTO:  ', style: styleCrearPersonaltextForm()), //dinamico

                  Container(
                    width: size.width*0.57,
                    height: size.height*0.04,

                    child: TextFormField(
                      keyboardType: (personalProvider.tipoDocumento == 1 || personalProvider.tipoDocumento== 2)  ? TextInputType.number : TextInputType.text ,
                      maxLength: (personalProvider.tipoDocumento == 1 ) ? 8 : 12,
                      cursorHeight: 20,
                      style: const TextStyle(fontSize: 15, color: Colors.black),
                      decoration:inputDecorationDatos() ,
                    )

                  )
                
                ],
        
              ),
        
              SizedBox(height: size.height*0.02), 
              
              //CAMPO PARA EL PRIMER NOMBRE
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
        
                  Text('NOMBRE:  ', style: styleCrearPersonaltextForm()),
                  Container(
                    width: size.width*0.57,
                    height: size.height*0.04,
                    child: TextFormField(
                      cursorHeight: 20,
                      style: const TextStyle(fontSize: 15, color: Colors.black),
                      decoration:inputDecorationDatos() ,
                    )
                  )
                ]
              ),

              SizedBox(height: size.height*0.02), 

              //CAMPO PARA EL SEGUNDO NOMBRE              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
        
                  Text('S. NOMBRE:  ', style: styleCrearPersonaltextForm()),
                  Container(
                    width: size.width*0.57,
                    height: size.height*0.04,
                    child: TextFormField(
        
                      cursorHeight: 20,
                      style: const TextStyle(fontSize: 15, color: Colors.black),
                      decoration:inputDecorationDatos() ,
                    )
                  )
                
                ]
              ),

              SizedBox(height: size.height*0.02), 
        
              //CAMPO PARA EL PRIMER APELLIDO
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
        
                  Text('APELLIDO:  ', style: styleCrearPersonaltextForm()),
                  Container(
                    width: size.width*0.57,
                    height: size.height*0.04,
                    child: TextFormField(
                      cursorHeight: 20,
                      style: const TextStyle(fontSize: 15, color: Colors.black),
                      decoration:inputDecorationDatos() ,
                    )
                  )
                
                ]
              ),
        
              SizedBox(height: size.height*0.02), 
        
              //CAMPO PARA EL SEGUNDO APELLIDO
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
        
                  Text('S. APELLIDO:  ', style: styleCrearPersonaltextForm()),
                  Container(
                    width: size.width*0.57,
                    height: size.height*0.04,
                    child: TextFormField(
                      cursorHeight: 20,
                      style: const TextStyle(fontSize: 15, color: Colors.black),
                      decoration:inputDecorationDatos() ,
                    )
                  )
                
                ]
              ),
              SizedBox(height: size.height*0.02), 
        
              //CAMPO PARA LA EMPRESA
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
        
                  Text('EMPRESA: ', style: styleCrearPersonaltextForm()),

                  DropdownButtonWidget(
                    items: dropdownItemsEmpresas, 
                    hintText: 'SELECCIONE LA EMPRESA', 
                    onchanged: (value)=>personalProvider.empresa = value!
                  )
        
       
                ]
              ),
              SizedBox(height: size.height*0.02), 

              //CAMPO PARA EL CARGO
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
        
                  Text('CARGO: ', style: styleCrearPersonaltextForm()),


                  DropdownButtonWidget(
                    items: dropdownItemsCargo, 
                    hintText: 'SELECCIONE EL CARGO', 
                    onchanged: (value)=> personalProvider.cargo = value!
                  )
               
                ]
              ),
              SizedBox(height: size.height*0.02), 
        
              //CAMPO PARA SEXO
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
        
                  Text('SEXO: ', style: styleCrearPersonaltextForm()),

                  DropdownButtonWidget(
                    items: dropdownItemSexo, 
                    hintText: 'SELECCIONE EL SEXO', 
                    onchanged: (value)=> personalProvider.valorSexo = value! ,
                  )
                
                ]

              ),
              SizedBox(height: size.height*0.03),

              //FOTO
              ImageWidget(
                urlimage:(personalProvider.foto==null)? null : personalProvider.foto!.path
              ),

            ],

          ),

        ),
        
      ),

    );

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

  List<DropdownMenuItem<int>> get dropdownItemSexo{

    List<DropdownMenuItem<int>> menuItems = [
      const DropdownMenuItem(value: 1, child: Text('HOMBRE')),
      const DropdownMenuItem(value: 2, child: Text('MUJER')),
    ];

    return menuItems;

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

  List<DropdownMenuItem<int>> get dropdownItemsTipoDocumento{

    List<DropdownMenuItem<int>> menuItems = [
      const DropdownMenuItem(value:1, child: Text('DNI')),
      const DropdownMenuItem(value:2, child: Text('CARNET DE EXTRANJERIA')),
      const DropdownMenuItem(value:3, child:Text('PASAPORTE')),
    ];

    return menuItems;

  }

  InputDecoration inputDecorationTipoDoc( String labeltext, String hinttext ) => InputDecoration(
    hintText: hinttext,
    labelText: labeltext,
  );

  InputDecoration inputDecorationDatos()=> const  InputDecoration(

    counterText: '',
    

    enabledBorder:  OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(
        color: Colors.black
      )
    ),

    focusedBorder:  OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(
        color: Colors.black
      )
    ),

  );


}