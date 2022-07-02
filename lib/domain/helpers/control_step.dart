import 'package:flutter/material.dart';

Widget controlbuilder(BuildContext context, ControlsDetails details){

  return Row(
    children: <Widget>[

      TextButton(
        onPressed: details.onStepContinue,
        child: Text('Continue to Step ${details.stepIndex + 1}'),
      ),

      TextButton(
        onPressed: details.onStepCancel,
        child: Text('Back to Step ${details.stepIndex - 1}'),
      ),
      
    ],
  );

}