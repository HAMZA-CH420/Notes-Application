import 'package:flutter/material.dart';
import 'package:notes/Ui/Todo_App/UiHelper/List_of_Todos.dart';
import 'package:notes/Ui/Todo_App/UiHelper/Uihelper.dart';

class TodoScreen extends StatefulWidget {
  TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => TodoScreenState();
}

class TodoScreenState extends State<TodoScreen> {
  TextEditingController searchController = TextEditingController();
  TextEditingController TodoText = TextEditingController();

  List<String> items =[] ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        leading: Icon(
          Icons.menu,
          size: 30,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              Icons.account_circle,
              size: 45,
              color: Colors.grey,
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customTextField(controller: searchController),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Text("All ToDos",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListOfTodos(
                  todoText: items[index],
                  index: index,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                padding: EdgeInsets.symmetric(vertical: 100),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10)),
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        controller: TodoText,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 15),
                          border: InputBorder.none,
                          hintText: 'Add Task',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                              child: OutlinedButton(
                            onPressed: () {
                              var text = TodoText.text;
                              if(text.isNotEmpty){
                                items.add(text);
                              }else{
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Add all fields")));
                              }
                              Navigator.pop(context);
                              setState(() {
                              });
                            },
                            child: Text("Add Task"),
                            style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                          )),
                          SizedBox(
                            width: 4,
                          ),
                          Expanded(
                              child: OutlinedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Canceled")));
                            },
                            child: Text("Cancel"),
                            style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                          )),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
