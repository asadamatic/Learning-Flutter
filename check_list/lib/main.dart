import 'package:checklist/Task.dart';
import 'package:flutter/material.dart';

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
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Checklist'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Task> tasks = [Task(text: 'Read', state: false), Task(text: 'Read', state: false), Task(text: 'Read', state: false)];

  TextEditingController taskController = TextEditingController();
  bool taskValidator = false;

  void _addItem(task) {
    setState(() {
      tasks.add(task);
    });
  }
  void _deleteItem(task){
    setState(() {
      tasks.remove(task);
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TextField(
              controller: taskController,
              decoration: InputDecoration(
                hintText: 'Enter To Do Item',
                errorText: taskValidator ? 'Enter The Task Title!' : null,
              ),
            ),
            Expanded(
              child: ListView(
                children: tasks.map((task) => CustomCheckBox(key: UniqueKey(), task: task, delete: _deleteItem)).toList()
              ),
            )
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          taskController.text.isEmpty ? taskValidator = true : taskValidator = false;
          if (!taskValidator){
            _addItem(Task(text: taskController.text, state: false));
          }
        },
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class CustomCheckBox extends StatefulWidget{

  Task task;
  Function delete;
  Key key;
  CustomCheckBox({this.key, this.task, this.delete});

  @override
  State createState() {
    return _CustomCheckBoxState(task: this.task, delete: this.delete);
  }
}

class _CustomCheckBoxState extends State<CustomCheckBox>{

  Task task;
  Function delete;
  _CustomCheckBoxState({this.task, this.delete});

  @override
  Widget build(BuildContext context) {

    return Card(
      child: Column(
        children: <Widget>[
          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
              title: Text(task.text),
              value: task.state,
              onChanged: (bool value){
                setState(() {
                  task.state = value;
                });
              },
            ),
          ButtonBar(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.delete,
                ),
                onPressed: (){
                  this.delete(task);
                },
              )
            ],
          )
        ],
      )
    );
  }
}
