import 'package:flutter/material.dart';

class SnackBarNotification {



  void _displaySnackBar({required BuildContext context, required SnackBar snackBar }){
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void openSnackBar({required BuildContext context, required String text}){
    final snackBar = SnackBar(

      content: Text(text, style: const TextStyle(fontSize: 16),),
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.red,

    );

    _displaySnackBar(context: context, snackBar: snackBar);
   
  } 









  
}