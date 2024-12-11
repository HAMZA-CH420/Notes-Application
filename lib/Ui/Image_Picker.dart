import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notes/Ui/utils.dart';

class ImagePickerClass extends StatefulWidget {
   ImagePickerClass({super.key});

  @override
  State<ImagePickerClass> createState() => _ImagePickerClassState();
}

class _ImagePickerClassState extends State<ImagePickerClass> {
 final picker = ImagePicker();
 late File pickedImage;
 dynamic SelectedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          "Pick An Image",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectedImage == null? profileImage():
            Container(
              height: 200,
              width: double.infinity,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Colors.blue,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: FileImage(SelectedImage)),
              ),
            ),
            ElevatedButton(
                onPressed: () async{
                  var pickGalleryImages = await picker.pickImage(source: ImageSource.gallery);
                  if(pickGalleryImages != null){
                    pickedImage = File(pickGalleryImages.path);
                    setState(() {
                      SelectedImage = pickedImage;
                    });
                  }else{
                    showToastMessage("No image Selected");
                  }
                },
                child: Text("Pick Image")),
            ElevatedButton(
                onPressed: ()async{
              var cameraImage = await picker.pickImage(source: ImageSource.camera);
              if(cameraImage != null){
                pickedImage = File(cameraImage.path);
                setState(() {
                  SelectedImage = pickedImage;
                });
              }else{
                showToastMessage("no image captured");
              }
            }, child: Text("Open Camera"))
          ],
        ),
      ),
    );
  }
  Widget profileImage(){
    return Stack(
      fit: StackFit.passthrough,
      children: [
        Icon(Icons.account_circle,color: Colors.blue,size: 140,),
        Positioned(child: Icon(Icons.add_a_photo_outlined,),left: 110,bottom: 4,)
      ],
    );
  }
}
