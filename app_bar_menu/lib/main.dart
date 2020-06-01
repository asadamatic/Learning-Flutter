import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('App Menu'),
        iconTheme: IconThemeData(

        ),
        centerTitle: false,
        automaticallyImplyLeading: true,
        leading: GestureDetector(
          onTap: () {},
          child: Icon(
              Icons.menu
          ),
        ),
        actions: <Widget>[
        Padding(
        padding: EdgeInsets.only(right: 20.0),
        child: GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.search
          ),
        )
        ),

          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.settings
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.more_vert,
              ),
            ),
          )
        ],
        actionsIconTheme: IconThemeData(
          color: Colors.white
        ),

      ),
    ),
  ));
}
