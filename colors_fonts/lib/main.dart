import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text(
            'Colors & Fonts',
            style: TextStyle(
              fontFamily: 'Lato',
                  letterSpacing: 2.0,
            ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      body: Center(
        child: Text(
            'Practicing Colors and Fonts',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Lato',
            ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 50,
        ),
        color: Colors.red[600],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text('CLick'),
        backgroundColor: Colors.red[600],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    ),
  ));
}
