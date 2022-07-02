import 'package:apppeople/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';

showLoading(BuildContext context)async{
  CustomProgressDialog progressDialog = CustomProgressDialog(context,blur: 10);

  progressDialog.setLoadingWidget(CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(AppTheme.lighTheme.primaryColor)));
  progressDialog.show();

  await Future.delayed(const Duration(seconds: 3));

  progressDialog.dismiss();
  
}