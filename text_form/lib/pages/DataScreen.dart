import 'package:flutter/material.dart';

class DataScreen extends StatefulWidget{


  @override
  State createState() {
    return _DataScreeenState();
  }
}

class _DataScreeenState extends State<DataScreen>{

  Map data;
  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(data['email']),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(data['password']),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: RaisedButton(
                child: Text('Back'),
                onPressed: (){
                  Navigator.pop(context, {
                    'email': 'dummy@gmail.com'
                  });
                },
              )
            ),

          ],
        ),
      ),
    );
  }
}