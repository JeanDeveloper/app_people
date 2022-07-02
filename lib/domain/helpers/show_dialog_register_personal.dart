import 'package:apppeople/theme/theme.dart';
import 'package:flutter/material.dart';


  Future<void> showMyDialog(BuildContext context, String title, String content, Function accept) async {

    return showDialog<void>(
      context: context,
      barrierDismissible: false, 
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(content, style: AppTheme.lighTheme.textTheme.headline3?.copyWith(
                  color: Colors.black
                ),),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('SI'),
              onPressed: () =>accept(),
            ),
            TextButton(
              child: const Text('NO'),
              onPressed: () =>Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }
