import 'package:apppeople/presentation/utils/styles.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ButtonMenu extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function()? onpressed;

  const ButtonMenu({
    required this.icon, 
    required this.text, 
    this.onpressed
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Column(

      children: [

        IconButton(

          icon: Icon(icon, color: Colors.white,size: size.width*0.06),

          onPressed: onpressed,
        
        ),

        AutoSizeText(text,  style: textStyleLetter()),

      ],

    );
  
    
  }
}