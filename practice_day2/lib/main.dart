import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatelessWidget{


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Practice 1'),
      ),
      body: Builder(
        builder: (context) => Column(
          children: <Widget>[

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                    'Internet Bundles',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              )
              ],

            ),
            Divider(
              color: Colors.grey,
            ),
            Expanded(
              flex: 4,
              child: Row(
                children: <Widget>[

                  Expanded(
                    flex: 4,
                    child: Container(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          Container(
                              padding: EdgeInsets.only(left: 15.0, bottom: 10.0),
                              child: Text(
                                  'Monthly Shandar Offer',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),)
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 15.0, bottom: 35.0),
                            child: Text(
                                '30 GB Internet \n100 Minutes',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 15.0, bottom: 10.0),
                            child: Text(
                              '*Rates are inclusive of taxes.',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,

                        children: <Widget>[

                          Container(
                            child: Text(
                              'Rs 300',
                               style: TextStyle(
                                 fontSize: 24
                               ),
                            ),
                          ),
                          Container(
                            child: RaisedButton(
                              color: Colors.blue,
                              textColor: Colors.white,
                              child: Text('Subscribe'),
                              onPressed: () {
                                final snackbar = SnackBar(
                                  content: Text('Subscription Successful.'),
                                );
                                Scaffold.of(context).showSnackBar(snackbar);
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                ],
              ),

            ),
            Divider(color: Colors.grey,),
            Expanded(
              flex: 4,
              child: Row(
                children: <Widget>[

                  Expanded(
                    flex: 4,
                    child: Container(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          Container(
                              padding: EdgeInsets.only(left: 15.0, bottom: 10.0),
                              child: Text(
                                'Monthly Shandar Offer',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),)
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 15.0, bottom: 35.0),
                            child: Text(
                              '30 GB Internet \n100 Minutes',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 15.0, bottom: 10.0),
                            child: Text(
                              '*Rates are inclusive of taxes.',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,

                        children: <Widget>[

                          Container(
                            child: Text(
                              'Rs 300',
                              style: TextStyle(
                                  fontSize: 24
                              ),
                            ),
                          ),
                          Container(
                            child: RaisedButton(
                              color: Colors.blue,
                              textColor: Colors.white,
                              child: Text('Subscribe'),
                              onPressed: () {

                                final snackbar = SnackBar(
                                  content: Text('Subscription Successful.'),
                                );
                                Scaffold.of(context).showSnackBar(snackbar);
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                ],
              ),

            ),
            Divider(color: Colors.grey,),
            Expanded(
              flex: 1,
              child: Row(
                children: <Widget>[],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
            backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,

              ),
              title: Text('Home')
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.inbox,

              ),
              title: Text('Mail')
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Fluttertoast.showToast(
              msg: "This is Center Short Toast",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black45,
              textColor: Colors.white,
              fontSize: 16.0
          );
        },
        child: Icon(
          Icons.help
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
