import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ,
      body: Column(
        children: <Widget>[
          Center(
            child: Container(
              color: Colors.amber[400],
              child: Text('Container is a great widget.', style: TextStyle(fontSize: 54),),
              alignment: Alignment(0.0, 0.0),
              constraints: BoxConstraints(minHeight: 100, minWidth: 100, maxHeight: 200, maxWidth: 200),

            ),
          ),
          Center(
            child: Container(

              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('Assets/image.jpg'),
                  fit: BoxFit.fill
                ),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: Colors.black)
              ),
              constraints: BoxConstraints(minHeight: 100, minWidth: 100, maxWidth: 300, maxHeight: 300),
            ),
          )
        ],
      )


    );
  }
}
