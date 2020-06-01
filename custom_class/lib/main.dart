import 'package:flutter/material.dart';
import 'Quote.dart';
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

  List<Quote> quotes = [Quote(quote:'Love yourself.', author:'Asad'),Quote(quote:"You're awesome", author:'Asad'), Quote(quote:"Work Hard.", author:'MQ')];
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
                children: quotes.map((quote) => Text('${quote.quote} - ${quote.author}')).toList()
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
            quotes.add(Quote(quote:'Follow your dreams.', author:'Ahsan'));
          });
        },

      ),
    );
  }
}


