import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notes/providers/Db_Provider.dart';
import 'package:provider/provider.dart';

class AddNotePage extends StatelessWidget {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  String title;
  String desc;
  int sno;
  bool isUpdate;

  AddNotePage({
    this.isUpdate = false,
    this.title = "",
    this.desc = "",
    this.sno = 0,
  });
  @override
  Widget build(BuildContext context) {
    if(isUpdate){
      titleController.text = title;
      descController.text = desc;
    }
    return Scaffold(
      body: Center(
        child: Container(width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(11.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  isUpdate?"Update Note":"Add Note",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,

                  decoration: BoxDecoration(
                      border: Border.all(), borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                        hintText: "Note",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 90,
                  decoration: BoxDecoration(
                      border: Border.all(), borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, top: 20),
                    child: TextField(
                      controller: descController,
                      decoration: InputDecoration(
                        hintText: "Description",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          var title = titleController.text;
                          var desc = descController.text;
                          if(title.isNotEmpty && desc.isNotEmpty){
                            if(isUpdate){
                              context.read<DbProvider>().UpdateNote(title, desc, sno);
                            }else{
                              context.read<DbProvider>().AddNote(title, desc);
                            }
                          }else{
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please fill all the required fields')));
                          }
                         Navigator.pop(context);
                        },
                        child: Text(isUpdate?"Update Note":'Add Note'),
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                      ),
                    ),
                    SizedBox(width: 8,),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Cancel'),
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
