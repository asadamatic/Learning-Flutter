import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Bottom Nav Menu'),
      ),
      body: Center(
        child: Text('Adding menu to Botom Nav'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
      type: BottomNavigationBarType.shifting,
        items: [
          
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.blue,
              size: 30.0,
            ),
            title: Text('Home')
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.verified_user,
              color: Colors.blue,
              size: 30.0
            ),
            title: Text('User')
          )
        ],
      ),
    ),
  ));
}
