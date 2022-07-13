import 'package:apppeople/domain/helpers/show_snackbar_awesome.dart';
import 'package:apppeople/domain/providers/login_global.dart';
import 'package:apppeople/domain/providers/login_provider.dart';
import 'package:apppeople/domain/providers/radio_list_providers.dart';
import 'package:apppeople/domain/providers/register_form_provider.dart';
import 'package:apppeople/domain/repositories/validaciones/consutar_movimiento.dart';
import 'package:apppeople/presentation/utils/input_decorations.dart';
import 'package:apppeople/presentation/utils/styles.dart';
import 'package:apppeople/presentation/widgets/widgets.dart';
import 'package:apppeople/theme/theme.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormRegister extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final tipoProvider = Provider.of<RadioListProvider>(context);

    return Container(

      margin: const EdgeInsets.all(15),
      width: size.width,
      height: size.height,
      alignment: Alignment.center,

      child: SingleChildScrollView(
      
        child: Column(
        
          children: [
      
            _TipoCarnet(),
            SizedBox(height: size.height*0.05),
      
            if(tipoProvider.getValorTipoDocumento==1)
              const _DNIFormRegister(),
            
            if(tipoProvider.getValorTipoDocumento==2)
              const _CarnetFormRegister(),
            
            if(tipoProvider.getValorTipoDocumento==3)
              const _PasaporteFormRegister(),
        
          ],
        
        ),
      
      ),

    );

  }

}


class _TipoCarnet extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final tipoProvider = Provider.of<RadioListProvider>(context);

    return Container(
      padding: const EdgeInsets.all(10),
      alignment: Alignment.topCenter,
      width: double.infinity,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          // radio de dni, por defecto esta encendido
          SizedBox(
            width: size.width*0.25,
            child: RadioListTile<int>(
              
              activeColor: Colors.white,
              contentPadding: const EdgeInsets.all(0),
              value:1, 
              groupValue: tipoProvider.getValorTipoDocumento, 
              onChanged: (value){
                tipoProvider.setValorTipoDocumento=value! ;
              },
              title: AutoSizeText('DNI', style:AppTheme.lighTheme.textTheme.headline3),
            ),
          ),

          // radio de extranjeria
          SizedBox(
            width: size.width*0.25,
            child: RadioListTile<int>(
              activeColor: Colors.white,
              contentPadding: const EdgeInsets.all(0),
              value: 2, 
              groupValue: tipoProvider.getValorTipoDocumento, 
              onChanged: (value){
                tipoProvider.setValorTipoDocumento=value! ;
              },
              title: AutoSizeText('CE', style: AppTheme.lighTheme.textTheme.headline3),
            ),
          ),

          // radio de pasaporte
          SizedBox(
            width: size.width*0.35,
            child: RadioListTile<int>(
              value: 3, 
              groupValue: tipoProvider.getValorTipoDocumento, 
              activeColor: Colors.white,
              contentPadding: const EdgeInsets.all(0),
              title: AutoSizeText('PASAPORTE', style: AppTheme.lighTheme.textTheme.headline3),
              onChanged: (value){
                tipoProvider.setValorTipoDocumento=value!;
              },
            ),
          ),

        ],
      
      ),

    );

  }

}

class _DNIFormRegister extends StatelessWidget {

  const _DNIFormRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final loginProvider = Provider.of<LoginGlobalProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [

        AutoSizeText('INGRESE EL NUMERO DE DNI', style: AppTheme.lighTheme.textTheme.headline2,), 

        NumPad(
          
          length: 8,

          onPressed: (String value) async{

            if( value == '' || value.length<8 ){
              
              showSnackBarAwesome(context, 'Error', 'Ingrese un dni valido', ContentType.failure);

            }else{

              consultarMovimiento(context, value, loginProvider.codServicio);

            }

          },

        )
      
      ],

    );
  
  }

}

class _CarnetFormRegister extends StatelessWidget {
  
  const _CarnetFormRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    final loginProvider = Provider.of<LoginGlobalProvider>(context);
    
    return Column(

      children: [

        AutoSizeText('INGRESE EL CARNET DE EXTRANJERIA', style: textstylewelcome(context), maxLines: 1, minFontSize: 6,),            
        
        NumPad(
          
          length: 9,

          onPressed: (String value) async{

            if( value == '' || value.length<9 ){
              
              showSnackBarAwesome(context, 'Error', 'Ingrese un Pasaporte valido', ContentType.failure);

            }else{

              consultarMovimiento(context, value, loginProvider.codServicio);

            }

          },

        )
      
      ],

    );

  }

}

class _PasaporteFormRegister extends StatelessWidget {
  const _PasaporteFormRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final registerForm = Provider.of<RegisterFormProvider>(context);
    return Container(

      width: size.width*0.8,
      height: size.height*0.67,

      child: Column(

        mainAxisAlignment: MainAxisAlignment.start,

        children: [

          Form(
            key: registerForm.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
    
            child: TextFormField(
              
              cursorWidth: size.width>500? 3 : 2,
              cursorHeight: size.width>500? 60 : 40,
              style: const TextStyle(fontSize:30, color: Colors.white ),
              maxLength: 12,
              textInputAction: TextInputAction.go,
              autocorrect: false,
              keyboardType: TextInputType.text,
              decoration: InputDecorations.formInputDecoration(
                labelText: 'Pasaporte'
              ),
    
    
              onChanged: (value){
                registerForm.pasaporte = value;
              },
    
              validator: (value){
                return value!.length<12
                  ? ""
                  : null;
              },
                
            ),
    
          ),

          const SizedBox(height:20),
    
          TextButton(
            child: const Text('BUSCAR', style: TextStyle(fontSize: 25, color: Colors.white),),
            onPressed: (){
              print(registerForm.pasaporte);
              FocusScope.of(context).requestFocus(FocusNode());

            }, 
          )      
        
        
        ],

      ),

    );

  }

}

