import 'package:apppeople/presentation/pages/login/widgets/widgets.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  Stack(

      children: const [

        LoginBackGround(),
        LoginBody(),

      ],

    );
    
  }

}