import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';
import 'dart:math' as math;
void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget{

  @override
  State createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home>{


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: TabBarView(
            children: <Widget>[
              CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  automaticallyImplyLeading: true,
                  leading: Icon(
                    Icons.directions_car
                  ),
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(
                          Icons.search
                      ),
                      onPressed: (){

                      },
                    )
                  ],
                  title: Text('Sliver App Bar'),
                  expandedHeight: 150.0,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text('Good Morning Asad'),
                    centerTitle: true,

                  ),
                  floating: true,
                  snap: true,
                  bottom: TabBar(
                    tabs: <Widget>[
                      Tab(
                        icon: Icon(
                          Icons.directions_car,

                        ),
                      ),
                      Tab(
                        icon: Icon(
                          Icons.directions_car,

                        ),
                      ),
                    ],
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _SliverAppBarDelegate(
                    minHeight: 70.0, maxHeight: 200.0, child: Container(color: Colors.red,child:Text('Header 1')),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    Container(color: Colors.red, height: 200.0,),
                    Container(color: Colors.blue, height: 200.0,),
                    Container(color: Colors.green, height: 200.0,),
                  ]),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _SliverAppBarDelegate(
                    minHeight: 70.0, maxHeight: 200.0, child: Container(color: Colors.black,child:Text('Header 1')),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index){
                        bool checkValue = false;
                        RandomColor randomColor = RandomColor();
                        return Container(color: randomColor.randomColor(), height: 100.0, child: CheckboxListTile(
                          title: Text('Task $index'),
                          value: checkValue,
                          onChanged: (value){
                            setState(() {
                              checkValue = value;
                            });
                          },
                        ),
                        );
                      },
                    childCount: 10,
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _SliverAppBarDelegate(
                    minHeight: 70.0, maxHeight: 200.0, child: Container(color: Colors.indigo,child:Text('Header 1')),
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _SliverAppBarDelegate(
                    minHeight: 70.0, maxHeight: 200.0, child: Container(color: Colors.green,child:Text('Header 1')),
                  ),
                ),
                SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  delegate: SliverChildListDelegate(
                    [
                      Container(color: Colors.red, height: 200.0,),
                      Container(color: Colors.blue, height: 200.0,),
                      Container(color: Colors.green, height: 200.0,),
                      Container(color: Colors.red, height: 200.0,),
                      Container(color: Colors.amber, height: 200.0,),
                      Container(color: Colors.yellow, height: 200.0,),
                    ]
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _SliverAppBarDelegate(
                    minHeight: 70.0, maxHeight: 200.0, child: Container(color: Colors.amber,child:Text('Header 1')),
                  ),
                ),
                SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index){
                        bool checkValue = true;
                        RandomColor randomColor = RandomColor();
                        return Container(color: randomColor.randomColor(), height: 100.0, child: CheckboxListTile(
                          title: Text('Task $index'),
                          value: checkValue,
                          onChanged: (value){
                            checkValue = value;
                          },
                        ),
                        );
                      },
                    childCount: 50
                  ),
                )
              ],
            ),
              Container(color: Colors.red, height: 200.0,)
            ],
          ),
        ),
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
  Widget build(
      BuildContext context,
      double shrinkOffset,
      bool overlapsContent)
  {
    return new SizedBox.expand(child: child);
  }
  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}