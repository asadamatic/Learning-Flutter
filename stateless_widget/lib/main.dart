import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));

}

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateless Widget'),
      ),
      body: Center(
        child: Image(
          image: NetworkImage('https://images.pexels.com/photos/4436700/pexels-photo-4436700.jpeg?cs=srgb&dl=black-metal-framed-glass-window-4436700.jpg&fm=jpg'),
        )
      ),
    );
  }
}


