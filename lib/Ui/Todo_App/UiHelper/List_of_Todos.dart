import 'package:flutter/material.dart';
import 'package:notes/Ui/Todo_App/ToDo_Screen.dart';

class ListOfTodos extends StatefulWidget {
   ListOfTodos({super.key, required this.todoText,required this.index});
  final String todoText;
  final  index;

   @override
  State<ListOfTodos> createState() => _ListOfTodosState();
}

class _ListOfTodosState extends State<ListOfTodos> {
  late List<String> Items;
  @override
  void initState() {
    super.initState();
   Items = TodoScreenState().items;
  }

  @override
  Widget build(BuildContext context) {
    return
      Container(
        padding: EdgeInsets.only(bottom: 20),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: ListTile(
          onTap: (){},
          contentPadding: EdgeInsets.symmetric(horizontal: 9),
          tileColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          trailing: IconButton(
              onPressed: () {
                Items.removeAt(widget.index);
              },
              icon: Icon(
                Icons.delete,
                color: Colors.red,
                size: 27,
              )),
          title: Text(
            widget.todoText,
            style:
                TextStyle(fontSize: 16, ),
          ),
          leading: Icon(
            Icons.check_box,
            color: Colors.blue,
          ),
      ),
    );
  }
}
