import 'package:flutter/material.dart';
import 'package:tabbarlist/TabChoices.dart';
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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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

  List<TabChoices> tabs = [TabChoices(title: 'Car', icon: Icon(Icons.directions_car)), TabChoices(title: 'Bike', icon: Icon(Icons.directions_bike)), TabChoices(title: 'Bus', icon: Icon(Icons.directions_bus))];
  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          bottom: TabBar(
            tabs: tabs.map((tab) => Tab(text: tab.title, icon: tab.icon,)).toList(),
          ),
        ),
        body: TabBarView(
          children: tabs.map((tab) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(tab.title),
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: tab.icon,
                  ),
                ],
              ),
          ),
          ).toList(),
        ),
      ),
    );
  }
}
