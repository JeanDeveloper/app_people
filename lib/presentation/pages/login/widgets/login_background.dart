import 'package:flutter/material.dart';


class LoginBackGround extends StatelessWidget {

  const LoginBackGround({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
    
      decoration: const BoxDecoration(
    
        image:DecorationImage(
    
          image: AssetImage('assets/fondo-login-mejorado2.jpg'),
          fit: BoxFit.cover,
        
        )
    
      ),
    
    );

  }

}

