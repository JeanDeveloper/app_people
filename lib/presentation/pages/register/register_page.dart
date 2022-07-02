import 'package:apppeople/domain/providers/numpad_provider.dart';
import 'package:apppeople/domain/providers/radio_list_providers.dart';
import 'package:apppeople/domain/providers/register_form_provider.dart';
import 'package:apppeople/presentation/pages/register/widgets/widgets.dart';
import 'package:apppeople/presentation/utils/barcode_validate.dart';
import 'package:apppeople/presentation/widgets/widgets.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class RegisterPage extends StatelessWidget {

  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final registerProvider = Provider.of<RegisterFormProvider>(context);
    
    return MultiProvider(

      providers: [

        ChangeNotifierProvider(create:  ((context) =>  RadioListProvider())),
        
      ],

      child: Scaffold(
        
        body: Container(

          width: size.width,
          height: size.height,
          
          child: Stack(

            children:  [

              //FONDO
              const HomePageBackGround(),

              (registerProvider.isLoading)
              ? const Center(child:  CircularProgressIndicator())

              //FORMULARIO DE REGISTRO
              :FormRegister(),
              
              //MENU BOTTOM
              Positioned(
              
                bottom: 0,

                child: FondoMenu(

                padding: EdgeInsets.symmetric(vertical: size.height*0.035 ),
                  
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
              
                      //INICIO
                      ButtonMenu(
                        icon: Icons.home_outlined,
                        text: 'INICIO', 
                        onpressed:()=> Navigator.pushNamed(context, 'home'),
                      ),

                      SizedBox(width: size.width*0.1),
              
                      //SCANNER
                      ButtonMenu(

                        icon: Icons.scanner_outlined,
                        text: 'ESCANEAR', 

                        onpressed:()async{

                          String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode("#ff6666", 'Cancelar', true, ScanMode.BARCODE);

                          barcodeScan(context,barcodeScanRes);


                        },

                      ),
                    
                    ],

                  ),
              
                ),

              ),

            ],

          ),

        ),
        
      ),

    );
    
  }
  
}