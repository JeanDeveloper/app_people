import 'package:apppeople/domain/helpers/get_responsive_text.dart';
import 'package:apppeople/domain/providers/login_provider.dart';
import 'package:apppeople/presentation/pages/login/widgets/widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LoginBody extends StatelessWidget {
  const LoginBody({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final loginProvider = Provider.of<LoginProvider>(context);

    return  SafeArea(
    
      child: Scaffold(
        
        backgroundColor: Colors.transparent,
        
        body: Form(
        
          key: loginProvider.formKey,
        
          child: SingleChildScrollView(

            child: Column(
              
              mainAxisSize: MainAxisSize.max,
                
              children: [
                  
                SizedBox(height: size.height*0.185),
            
                Row(
            
                  mainAxisAlignment: MainAxisAlignment.center,
            
                  children:[
            
                      FadeInImage(
            
                        width: size.width*0.24,
                        height: size.width*0.24,
                        placeholder: const AssetImage('assets/loading.gif'), 
                        image: const AssetImage('assets/security.png') 
            
                      ),
            
                      SizedBox(width: size.width*0.05),
            
                      FadeInImage(
            
                        width: size.width*0.24,
                        height: size.width*0.24,
                        placeholder: const AssetImage('assets/loading.gif'), 
                        image: const AssetImage('assets/people.png')
                        
                      ),
            
                  ],
            
                ),
            
                SizedBox(height: size.height*0.15),
                
                AutoSizeText(
                
                  'INICIAR SESION', 
                  style: TextStyle(fontSize: getResponsiveText( size, size.height*0.034 ), fontWeight: FontWeight.bold, color:Colors.white),
                
                ),
            
                SizedBox(height: size.height*0.04),
                
                const ContainerForm(),
            
                SizedBox(height: size.height*0.08),
            
                Text('© ${DateTime.now().year} GRUPO SOLMAR Todos los derechos reservados', style: TextStyle(fontSize: getResponsiveText( size, size.height*0.01629 )),),     
                
                SizedBox(height: size.height*0.015)
                
              ],
                
            ),
          ),
        
        ),
        
      ),
    );

  }

}

class ContainerForm extends StatelessWidget {

  const ContainerForm({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final loginProvider = Provider.of<LoginProvider>(context);
    final size = MediaQuery.of(context).size;

    return Container(

      width: size.width*0.8,
      height: size.height*0.36,

      decoration: BoxDecoration(

        color:Colors.grey[500]?.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),

      ),

      child:Column(

        mainAxisAlignment: MainAxisAlignment.center,

          children: [

            LoginInputWidget(

              hintext: 'Usuario',
              
              icon: Icons.person,

              onchanged: (value)=>loginProvider.usuario = value,

              validator:(value){
            
                return (value!= '')
                ? null
                : "Por favor complete este campo";

              },

            ),

            LoginInputWidget(
              hintext: 'Contraseña', 
              icon: Icons.lock_outline_rounded, 
              isPassword: true,

              onchanged: (value)=>loginProvider.password = value,

              validator:(value){

                return (value!= '')
                ? null
                : "Por favor complete este campo";
            
              },


            ),
    
            LoginButton(

              onpressed: () async { 

                // ocultar el teclado del dispositivo
                FocusScope.of(context).unfocus();

                if(loginProvider.isValidForm()){

                  loginProvider.isLoading=true;

                  // DESCOMENTAR PARA PRESENTACION, TIEMPO DE DEMORA EN EL BOTON DEL LOGIN
                  
                  // await Future.delayed(const Duration(seconds: 2));
                  
                  loginProvider.isLoading=false;

                  Navigator.pushReplacementNamed(context, 'home');


                }

              },

            ),
          
          ],

      ),
    
    );
  
  }

}