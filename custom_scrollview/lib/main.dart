import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  )
  );
}

class Home extends StatefulWidget{

  @override
  State createState() {
    return _Home();
  }
}

class _Home extends State<Home>{


  @override
  Widget build(BuildContext context) {

    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: Text('Custom ScrollView'),
          floating: false,
          expandedHeight: 200.0,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            background:Image.asset('Assets/image.jpg', fit: BoxFit.cover,)
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 150.0,
          delegate:  SliverChildListDelegate(
            [
              Container(color: Colors.black, height: 150.0),
              Container(color: Colors.blue, height: 150.0),
              Container(color: Colors.green, height: 150.0),
            ]
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(color: Colors.red, height: 150.0),
              Container(color: Colors.purple, height: 150.0),
              Container(color: Colors.green, height: 150.0),
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
              (BuildContext context , int index){
                RandomColor randomColor = RandomColor();
                return Container(color: randomColor.randomColor(), height: 30.0,);
              },
            childCount: 100,
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
              Container(color: Colors.black, height: 200.0,)
            ]
          ),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index){
                RandomColor randomColor = RandomColor();
                return Container(color: randomColor.randomColor(), height: 50.0,);
              },
            childCount: 120,
          ),
        )
      ],
    );
  }
}
