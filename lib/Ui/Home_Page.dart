import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:notes/Ui/Image_Picker.dart';
import 'package:notes/Ui/settings_page.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import '../DataBase/DataBase.dart';
import '../providers/Db_Provider.dart';
import 'add_note_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<DbProvider>().getInitialNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(itemBuilder: (_){
            return [
              PopupMenuItem(child: Text("Settings"),onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage(),));})
            ];
          }),
        ],
      title: Text('Notes'),
        centerTitle: true,
      ),floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: SpeedDial(
        spaceBetweenChildren: 4,
        buttonSize: Size.square(50),
        overlayOpacity: 0.2,
        overlayColor: Colors.black,
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddNotePage(),));
          },
          elevation: 3,
          shape: CircleBorder(),
          child: Icon(Icons.add)
        ),
          SpeedDialChild(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ImagePickerClass(),));
              },
              elevation: 3,
              shape: CircleBorder(),
              child: Icon(Icons.add_photo_alternate_outlined)
          ),
        ],
      ),
      body: Consumer<DbProvider>(
        builder: (ctx, provider, __) {
          List<Map<String, dynamic>> AllNotes = ctx.watch<DbProvider>().getNotes();
          return AllNotes.isNotEmpty
              ? ListView.builder(
                  itemBuilder: (_, index) {
                    return ListTile(
                      leading:
                          Text('${AllNotes[index][DbHelper.Column_Notes_sno]}'),
                      title: Text(AllNotes[index][DbHelper.Column_Notes_title]),
                      subtitle: Text(
                          AllNotes[index][DbHelper.Column_Notes_desc]),
                      trailing: SizedBox(width: 60,
                        child: Row(children: [
                        InkWell(child: Icon(Icons.edit),onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNotePage(
                            title: AllNotes[index][DbHelper.Column_Notes_title],
                            isUpdate: true,
                            desc:  AllNotes[index][DbHelper.Column_Notes_desc],
                            sno: AllNotes[index][DbHelper.Column_Notes_sno],
                          )));
                        },),
                          SizedBox(width: 8,),
                          InkWell(child: Icon(Icons.delete,color: Colors.red,),onTap: (){
                            provider.DeleteNote(AllNotes[index][DbHelper.Column_Notes_sno]);
                          },)
                        ],),
                      ),
                    );
                  },
                  itemCount: AllNotes.length,
                )
              : Center(
                  child: Text('No Notes Added'),
                );
        },
      ),
    );
  }
}

