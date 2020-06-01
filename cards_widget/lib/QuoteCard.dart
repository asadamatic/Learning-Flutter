import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Quote.dart';

class QuoteCard extends StatelessWidget {

  final Quote quote;
  final Function delete;
  QuoteCard({this.quote, this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      elevation: 6.0,
      color: Colors.amber[300],
      borderOnForeground: true,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
        child: Column(
          children: <Widget>[
            Text(quote.quote),
            SizedBox(height: 6.0),
            Text(quote.author),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  onPressed: (){
                    Clipboard.setData(ClipboardData(text: quote.quote)).then((value) {
                      final snackbar = SnackBar(
                        content: Text('Quote copied to clip board.'),
                      );
                      Scaffold.of(context).showSnackBar(snackbar);
                    });
                  },
                  child: Text('Copy'),
                ),
                FlatButton(
                  onPressed: () {
                    this.delete(quote);
                  },
                  child: Text('Delete'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
