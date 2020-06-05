import 'package:bottomtabbar/Tab.dart';
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
      ),
      home: MyHomePage(title: 'Bottom Tabs'),
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

  List<TabCustom> tabs = [TabCustom(title: 'Car', icon: Icons.directions_car), TabCustom(title: 'Bike', icon: Icons.directions_bike), TabCustom(title: 'Ship', icon: Icons.local_shipping)];
  bool tabBarScroll = false;
  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(

          title: Text(widget.title),
        ),
        body: TabBarView(
          children: tabs.map((tab) => Center(
              child: Container(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(tab.title),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Icon(
                      tab.icon,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: IconButton(
                      icon: Icon(
                        Icons.delete
                      ),
                      onPressed: (){
                        setState(() {
                          tabs.remove(tab);
                          if (tabs.length <= 6){
                            tabBarScroll = false;
                          }
                        });
                      },
                    ),
                  )
                ],
              ),
              )
          )
          ).toList(),
        ),
        bottomNavigationBar: Container(
          color: Colors.blue,
          child: TabBar(
            isScrollable: tabBarScroll,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white38,
            tabs:
              tabs.map((tab) => Tab(text: tab.title, icon: Icon( tab.icon),)).toList(),

            ),
          ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
          ),
          onPressed: (){
            setState(() {
              tabs.add(TabCustom(title: 'New', icon: Icons.new_releases));
              if (tabs.length > 6){
                tabBarScroll = true;
              }
            });
          },
        ),
        ),

      );
  }
}
