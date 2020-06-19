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
      home: MyHomePage(title: 'Slide Transition'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{

  AnimationController animationController;
  Animation<Offset> animtaionOffset;
  bool check = false;
  int counter;
  @override
  void initState() {

    super.initState();
    animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    animtaionOffset =  Tween<Offset>(
      begin: Offset.zero,
      end: Offset(1.0, 0.0)
    ).animate(animationController);
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
            SlideTransition(
              position: animtaionOffset,
              child: Card(
                child: CheckboxListTile(
                  value: check,
                  title: Text('Task A'),
                  onChanged: (value){
                    setState(() {
                      check = value;
                    });
                  },
                  secondary: IconButton(
                    icon: Icon(
                    Icons.delete,
                    ),
                    onPressed: (){
                      animationController.forward();
                    },
                  ),
                ),
              )
            ),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.undo,
        ),
        onPressed: (){
          animationController.reverse();
        },
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }
}
