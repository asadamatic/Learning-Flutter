import 'package:animatedlist/TaskCustom.dart';
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
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Animated List'),
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

  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  List<TaskCustom> tasks = [TaskCustom(title: 'Work', status: false)];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: AnimatedList(
          key: _listKey,
          initialItemCount: tasks.length,
          itemBuilder: (context, index, animation){
            return CustomCard(key: UniqueKey(), task: tasks[index], animation: animation);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            int index = 1;
            TaskCustom newItem = TaskCustom(title: 'Asad', status: false);
            tasks.insert(index, newItem);
            _listKey.currentState.insertItem(index);
            for ( int i = 0; i < tasks.length; i++){
              print(tasks[i].title);
            }
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class CustomCard extends StatefulWidget{

  TaskCustom task;
  Key key;
  Animation animation;
  CustomCard({this.key, this.task, this.animation});

  @override
  State createState() {
    return _CustomCardState(task: this.task, animation: this.animation);
  }
}

class _CustomCardState extends State<CustomCard>{

  TaskCustom task;
  Animation animation;
  _CustomCardState({this.task, this.animation});

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: animation,
      child: Card(
        child: Row(
          children: <Widget>[
            Expanded(
              child: CheckboxListTile(
                title: Text(task.title),
                value: task.status,
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (bool value){
                  setState(() {
                    task.status = value;
                  });
                },
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.tab,
              ),
              onPressed: (){

              },
            ),
            ButtonBar(
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.delete,
                  ),
                  onPressed: (){

                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
