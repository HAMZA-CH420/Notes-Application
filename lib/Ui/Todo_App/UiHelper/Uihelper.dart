import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
Widget customTextField({required TextEditingController controller}){
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(22),
      color: Colors.white
    ),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 12),
        border: InputBorder.none,
        prefixIcon: Icon(Icons.search_outlined),
        hintText: "Search",
      ),
    ),
  );
}