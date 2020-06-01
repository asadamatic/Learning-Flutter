import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home  extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Button Widget'),
      ),
      body: Center(
        child: IconButton(
          onPressed: () {
            print('You pressed a button!');
          },
          icon: Icon(
            Icons.mail,
          ),
        ),
      ),

    );
  }
}
