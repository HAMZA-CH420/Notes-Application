import 'package:flutter/material.dart';
import 'package:notes/Ui/utils.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionRequests extends StatelessWidget {
  const PermissionRequests({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green.shade400,
          title: Text(
            "Permissions",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            ListTile(
              onTap: () async {
                await PermissionAsked(permission: Permission.microphone);
              },
              title: Text("Permission"),
              subtitle: Text("Ask permission for microphone"),
              leading: CircleAvatar(
                child: Icon(
                  Icons.mic,
                  color: Colors.white,
                ),
                backgroundColor: Colors.green,
              ),
            ),
            ListTile(
              onTap: ()async{
                await PermissionAsked(permission: Permission.camera);
              },
              title: Text("Camera Permission"),
              subtitle: Text("Ask permission for Camera"),
              leading: CircleAvatar(
                child: Icon(
                  Icons.camera,
                  color: Colors.white,
                ),
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ));
  }
}
