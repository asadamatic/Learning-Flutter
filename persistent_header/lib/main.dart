import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter/widgets.dart';
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
      home: MyHomePage(title: 'Persistent Header'),
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



  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[

            SliverAppBar(
              title: Text('App'),
              expandedHeight: 200.0,
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints){

                  return FlexibleSpaceBar(
                    centerTitle: true,
                    title: Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        margin: EdgeInsets.only(left: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Explore', style: TextStyle(color: Colors.white, fontSize: 16.0),),
                            Text('Pakistan', style: TextStyle(color: Colors.white, fontSize: 24.0),)
                          ],
                        ),
                      ),
                    ),
                    background: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        Image(
                          image: AssetImage('Assets/image.jpg'),
                          fit: BoxFit.cover,
                        ),
                        Container(
                          color: Colors.indigo.withOpacity(0.5),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            makeHeader('Sticky Header'),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index){

                    return Container(child: Text("$index"),);
                  }
              ),
            )
          ],
        ),
      ),
    );
  }

  SliverPersistentHeader makeHeader(String headerText) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        minHeight: 75.0,
        maxHeight: 75.0,
        child: Container(
            color: Colors.lightBlue, child: Center(child:
        Text(headerText))),
      ),
    );
  }
}
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;
  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => math.max(maxHeight, minHeight);
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {

    return Card(
      margin: EdgeInsets.all(10.0),
      elevation: 10.0,
      child: Container(
        height: maxHeight,
      ),
    );
  }
  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

