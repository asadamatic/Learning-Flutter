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

  List<Quote> quotes = [Quote(text: 'Work Hard', author: 'Asad'), Quote(text: 'Work Hard', author: 'Asad'), Quote(text: 'Work Hard', author: 'Asad')];

  TextEditingController quoteController = TextEditingController();
  bool validateQuote = false;
  TextEditingController authorController = TextEditingController();
  bool validateAuthor = false;

  void addQuote(quote){
    setState(() {
      quotes.add(quote);
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
        title: Text('Append List'),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[

            TextField(
              controller: quoteController,
              decoration: InputDecoration(
                hintText: 'Enter Quote Here',
                errorText: validateQuote ? "This field can't be empty": null,
              ),
            ),

            TextField(
              controller: authorController,
              decoration: InputDecoration(
                hintText: 'Enter Author Name Here',
                errorText: validateAuthor ? "This field can't be left empty": null
              ),
            ),
            Expanded(
              child: ListView(
                children: quotes.map((quote) => Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: QuoteCard(key: UniqueKey() ,quote: quote, deleteQuote: deleteQuote),
                )).toList(),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: (){

          setState(() {

            quoteController.text.isEmpty ? validateQuote = true : validateQuote = false;
            authorController.text.isEmpty ? validateAuthor = true: validateAuthor = false;

            if (!validateQuote && !validateAuthor){
              addQuote(Quote(text: quoteController.text, author: authorController.text));
            }

          });
        },
      ),
    );
  }
}

class QuoteCard extends StatefulWidget{
  Quote quote;
  Function deleteQuote;
  Key key;
  QuoteCard({this.key, this.quote, this.deleteQuote});


  @override
  State createState() {
    return _QuoteCardState(quote: this.quote, deleteQuote: this.deleteQuote);
  }
}

class _QuoteCardState extends State<QuoteCard>{

  Quote quote;
  Function deleteQuote;
  _QuoteCardState({this.quote, this.deleteQuote});

  @override
  Widget build(BuildContext context) {

    return Card(
      child: Column(
        children: <Widget>[
          Text(quote.text),
          SizedBox(height: 8.0),
          Text(quote.author),
          ButtonBar(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.content_copy
                ),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: quote.text));
                },
              ),
              IconButton(
                icon: Icon(
                    Icons.delete
                ),
                onPressed: () {
                  this.deleteQuote(quote);
                },
              )
            ],
          )
        ],
      ),
    );
  }
}