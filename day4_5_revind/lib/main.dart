import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Quote.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget{

  @override
  State createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home>{

  List<Quote> quotes = [Quote(quote: 'Work Hard.', author: 'Asad'), Quote(quote: 'Work Hard.', author: 'Asad'), Quote(quote: 'Work Hard.', author: 'Asad')];

  void addQuote(){
    setState(() {
      quotes.add(Quote(quote: 'Work Hard.', author: 'MQ'));
    });
  }

  void deleteQuote(quote){
    setState(() {
      quotes.remove(quote);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text('Motivational Quotes'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0),
        child: Column(
          children: <Widget>[
            Center(child: Text('List of Quotes', style: TextStyle(fontSize: 24,),)),
            SizedBox(height: 10.0,),
            Expanded(
              child: ListView(
                children:
                  quotes.map((quote) => QuoteCard(quote: quote, delete: deleteQuote)).toList()

              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[900],
        onPressed: () {
          addQuote();
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}

class QuoteCard extends StatelessWidget{

  final Quote quote;
  final Function delete;
  QuoteCard({this.quote, this.delete});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6.0,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 0.0),
        child: Column(
          children: <Widget>[
            Text(quote.quote),
            SizedBox(height: 8.0,),
            Text(quote.author),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Text('Copy'),
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: quote.quote));
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.delete,
                  ),
                  onPressed: () {
                    delete(quote);
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
