import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './task.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
       // accentColor: Color(0xFF455353)
      ),
      home: TodoScreen(),
      
    );
  }
}

class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<Task> tasks=[
    Task(description: "first task",done: false,id: 1),
    Task(description: "second task",done: false,id: 2),
    Task(description: "third task",done: false,id: 3),
  ];

  @override
  Widget build(BuildContext context) {

    onCheckboxClick(Task task)
    {
      setState(() {
        print("before"+task.done.toString());
        task.toggleDone();
        print(task.done);
      });
    }



    return Scaffold(
      appBar:AppBar(
        centerTitle: true,
        title : Text("Todo List",)
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ...tasks.map((task) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Checkbox(value: task.done, onChanged: (_)=> onCheckboxClick(task)),
              Text(task.description),
              IconButton(onPressed: (){}, icon: Icon(Icons.edit),)
            ],
          ))

        ],
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: (){}, label: Icon(Icons.add),),


    );
  }
}
