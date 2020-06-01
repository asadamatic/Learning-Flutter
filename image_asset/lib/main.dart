import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  )
  );
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Assets'),
      ),
      body: Container(
        child: Container(
        child: Image.asset('Assets/image1.jpg')
        ),
      ),

    );
  }
}
