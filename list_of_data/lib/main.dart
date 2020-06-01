import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Quotes(),
  ));
}

class Quotes extends StatefulWidget{

  @override
  State createState() {
    return _QuotesState();
  }
}

class _QuotesState extends State<Quotes>{

  List<String> quotes = ['Love yourself.',"You're awesome", "Work Hard."];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Motivational Quotes'),
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: Column(
              children: quotes.map((quote) => Text(quote)).toList()
            ),
          ),
          Center(
            child: Column(
              children: <Widget>[],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: (){
          setState(() {
            quotes.add('Follow your dreams.');
          });
        },
        
      ),
    );
  }
}


