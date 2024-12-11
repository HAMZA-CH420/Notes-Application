import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> PermissionAsked({required Permission permission})async{
  var status = await permission.status;
 if(status.isDenied){
   await permission.request();
   if(status.isGranted){
     showToastMessage("permission granted");
   }else if(status.isDenied){
     showToastMessage("permission denied");
   }
 }
}
Future showToastMessage(String message)async{
  await Fluttertoast.showToast(msg: message);
}