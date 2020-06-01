import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Scaffold'),
        centerTitle: true,
        titleSpacing: 2,
      ),
      body: Center(
        child: Text('Practicing Scaffold.'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('Click'),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    ),
  ));
}
