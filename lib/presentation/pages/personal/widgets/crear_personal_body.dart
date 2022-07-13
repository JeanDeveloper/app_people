import 'package:apppeople/domain/providers/crear_personal_provider.dart';
import 'package:apppeople/domain/providers/login_global.dart';
import 'package:apppeople/domain/repositories/validaciones/guardar_personal.dart';
import 'package:apppeople/presentation/pages/personal/widgets/widgets.dart';
import 'package:apppeople/presentation/utils/button_style_step.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CrearPersonalBody extends StatelessWidget {

  const CrearPersonalBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;
    final personalProvider = Provider.of<CrearPersonalProvider>(context);
    final globalProvider = Provider.of<LoginGlobalProvider>(context);

    return Stepper(
    
      currentStep: personalProvider.getValorStep,

      type: StepperType.horizontal,
      
      controlsBuilder: (BuildContext context, ControlsDetails details){
    
        return Row(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    
          children: <Widget>[
    
            Expanded(
    
              child: TextButton(
                
                style: getStyleButtonStep(context),

                onPressed: details.onStepContinue,

                child: Padding(
                  padding: const  EdgeInsets.all(8.0),
                  child: AutoSizeText( ( personalProvider.getValorStep == 1 ) ? 'GUARDAR': 'CONTINUAR', style:  TextStyle( color: Colors.white, fontSize: size.width*0.04)),
                ),

              ),
    
            ),
    
            SizedBox(width: (personalProvider.getValorStep != 0) ? size.width*0.1: null),
    
            if(personalProvider.getValorStep != 0 )
    
              Expanded(
    
                child: TextButton(
    
                  style: getStyleButtonStep(context),
                  onPressed: details.onStepCancel,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AutoSizeText('REGRESAR ', style: TextStyle(color: Colors.white, fontSize: size.width*0.04)),
                  ),
                  
                ),
    
              ),
    
          ],
    
        );
    
      } ,
    
      onStepContinue: (){
    
        if(personalProvider.getValorStep<=0){

          if(personalProvider.isValidForm(personalProvider.getValorStep)){

            personalProvider.setValorStep = personalProvider.getValorStep + 1;
            FocusScope.of(context).requestFocus(FocusNode());

          }
        
        }else{

          if(personalProvider.isValidForm(personalProvider.getValorStep)){

            //TODO: GUARDAR TODOS LOS DATOS DEL NUEVO PERSONAL

            //guardarPersonal();
            guardarPersonal(context);

            // print(personalProvider.tipoPersona);
            // print(personalProvider.empresa);
            // print(personalProvider.tipoDocumento);

            // print(personalProvider.foto ?? '');
            // print(personalProvider.cargo);
            // print(personalProvider.pNombre);
            // print(personalProvider.SNombre);
            // print(personalProvider.pApellido);
            // print(personalProvider.sApellido);
            // print(personalProvider.nDocumento);
            // print((personalProvider.sexo==1)?'M' : 'F');
            // print((personalProvider.foto==null)? 0 : 1 );
            // print(globalProvider.codEmpresa);


          }

        }
    
      },
    
      onStepCancel: (){
    
        if(personalProvider.getValorStep>0){
    
          personalProvider.setValorStep =  personalProvider.getValorStep - 1;
        
        }
    
      },
    
      steps: getSteps(context),
    
    );
     
  
  }

  List<Step> getSteps(BuildContext context ){

    final personalProvider = Provider.of<CrearPersonalProvider>(context, listen: false);

    return [

      Step(
        state: personalProvider.getValorStep>0 ? StepState.complete : StepState.indexed ,
        isActive: personalProvider.getValorStep>=0,
        title: const Text('Empezar',style: TextStyle(color: Colors.black)), 
        content: const FormDatosGenerales(),
      ),

      Step(
        isActive: personalProvider.getValorStep>=1,
        title: const Text('Terminar',style: TextStyle(color: Colors.black)), 
        content: FormDatosEmpresa(),
      ),
      
      
    ];


  }


}