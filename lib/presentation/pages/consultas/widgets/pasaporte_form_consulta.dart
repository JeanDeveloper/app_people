import 'package:apppeople/presentation/pages/login/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PasaporteFormConsulta extends StatelessWidget {
  
  const PasaporteFormConsulta({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    // final registerForm = Provider.of<RegisterFormProvider>(context);


    return Container(

      width: size.width*0.8,
      height: size.height*0.67,
      // color: Colors.red,

      child: Column(

        mainAxisAlignment: MainAxisAlignment.start,

        children: [

          Form(
            // key: registerForm.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            
            child: LoginInputWidget(

              validator: (value){
                return (value!= '' || value!.length>12)
                  ? null
                  :'ingrese algo por favor';
              },

              onchanged: (value)=> print(value) ,

              hintext: 'Ingrese el pasaporte', 
              icon: FontAwesomeIcons.idCard, 

            ),
       
          ),

          const SizedBox(height:20),
    
          TextButton(

            style: ButtonStyle(
              padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
              backgroundColor: MaterialStateProperty.all(Colors.blue),
            ),
            child: Text('BUSCAR', style: TextStyle(fontSize: size.width*0.05, color: Colors.white),),
            onPressed: ()=>FocusScope.of(context).requestFocus(FocusNode()), 

          )      
                
        ],

      ),

    );

  }


}