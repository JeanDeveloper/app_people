import 'package:apppeople/domain/helpers/get_responsive_text.dart';
import 'package:flutter/material.dart';

class LoginInputWidget extends StatelessWidget {

  final String hintext;
  final IconData icon;
  final bool isPassword;
  final void Function(String)? onchanged;
  final String? Function(String?)? validator;


  const LoginInputWidget({
    
    super.key, 
    required this.hintext, 
    required this.icon,
    this.isPassword =  false,
    required this.onchanged,
    required this.validator

  });


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;


    return Padding(
      
      padding: EdgeInsets.symmetric(vertical:size.height*0.01, horizontal:size.width*0.07),
      
      child: TextFormField(

        textCapitalization: TextCapitalization.characters,
        
        decoration: InputDecoration(

          contentPadding: EdgeInsets.symmetric(vertical: size.height*0.015),
          fillColor: Colors.white,
          filled: true,
          hintText: hintext,
      
          hintStyle: TextStyle(

            fontSize: getResponsiveText(size, size.width*0.045),
            color: Colors.black 
      
          ),
      
          errorStyle: TextStyle(
            
            fontSize: getResponsiveText(size, size.width*0.045 )

          ),
      
      
          prefixIcon: Padding(
            
            padding: EdgeInsets.symmetric(horizontal: size.width*0.07),
      
            child: Icon(

              icon,
              size:getResponsiveText(size, size.width*0.068),
              color: Colors.black,

            ),
      
          ),
      
          border: const OutlineInputBorder(
          
            borderRadius: BorderRadius.zero,
            
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
            ),
            
          ),
        
        ),
      
      
        style:  TextStyle(
      
          color: Colors.black,
          fontSize: getResponsiveText(size, size.width*0.045)
      
        ),
      
        textInputAction: TextInputAction.next,  
        keyboardType: TextInputType.name,
        obscureText: isPassword,
        validator: validator,
        onChanged: onchanged,
      
      
      ),

    );

  }

}