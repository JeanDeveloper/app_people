import 'package:apppeople/domain/providers/login_provider.dart';
import 'package:apppeople/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LoginButton extends StatelessWidget {

  void Function()? onpressed;

  LoginButton({
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final loginProvider = Provider.of<LoginProvider>(context);

    return Padding(

      padding: const EdgeInsets.symmetric(vertical:15.0, horizontal: 30),

      child: Container(

        height: size.height*0.06,
        width: size.width*0.8,

        decoration: const BoxDecoration(

          // borderRadius:BorderRadius.circular(16),
          color: Colors.blue

        ),

        child: TextButton(

          onPressed: onpressed,
          child: (!loginProvider.isLoading)
            ? Text(
              'Ingresar',

              style: TextStyle(
                fontSize: size.width*0.045,
                color: Colors.white
              )

            )
            : CircularProgressIndicator(color: AppTheme.lighTheme.primaryColor),

        )

      ),

    );

  }

}