import 'package:flutter/cupertino.dart';
import 'package:notes/DataBase/DataBase.dart';

class DbProvider extends ChangeNotifier{
  DbHelper dbhelper = DbHelper.getInstance();
  List<Map<String , dynamic>> _myNotes = [];
  List<Map<String , dynamic>> getNotes ()=> _myNotes;
  void AddNote (String title, String desc)async{
    bool check = await dbhelper.addNotes(title: title, desc: desc);
    if(check){
      _myNotes = await dbhelper.getAllNotes();
      notifyListeners();
    }

  }
  void UpdateNote(String title,String desc, int sno)async{
    bool check = await dbhelper.updateNote(title: title, desc: desc, sno: sno);
    if(check){
      _myNotes = await dbhelper.getAllNotes();
      notifyListeners();
    }
  }
  void DeleteNote(int sno)async{
    bool check = await dbhelper.deleteNote(sno: sno);
    if(check){
      _myNotes = await dbhelper.getAllNotes();
      notifyListeners();
    }
  }
  void getInitialNotes()async{
    _myNotes = await dbhelper.getAllNotes();
    notifyListeners();
  }
}