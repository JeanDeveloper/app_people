import 'package:apppeople/theme/theme.dart';
import 'package:flutter/material.dart';

class FondoMenu extends StatelessWidget {

  final Widget child;
  final EdgeInsets padding; 

  const FondoMenu({super.key, required this.child, required this.padding});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    
    return Container(

      padding: padding,
      width: size.width,
      alignment: Alignment.center,

      decoration: BoxDecoration(
        color:  AppTheme.lighTheme.primaryColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30.0))
      ),
      
      child: child,

    );
    
  }
}
