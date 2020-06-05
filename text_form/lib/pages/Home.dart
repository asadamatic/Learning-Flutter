import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _incrementCounter() {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Text Form'),
      ),
      body: Center(child: CustomForm()),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class CustomForm extends StatefulWidget{

  @override
  State createState() {

    return _CustomFormState();
  }
}

class _CustomFormState extends State<CustomForm>{

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool securePassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 30.0, left: 30.0),
              child: TextFormField(
                controller: emailController,
                validator: (value){
                  return value.isEmpty || !value.contains('@')? 'Please provide a valid email': null;
                },
                decoration: InputDecoration(
                  hintText: 'Email',
                  labelText: 'Email',
                ),
                autofocus: false,
                onChanged: (value){
                  setState(() {

                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30.0, left: 30.0),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: TextFormField(
                      controller: passwordController,
                      validator: (value){
                        return value.isEmpty? 'Please fill out this field': null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Password',
                        labelText: 'Passwrod',

                      ),
                      autofocus: false,
                      obscureText: securePassword,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.lock,
                    ),
                    onPressed: (){
                      setState(() {
                        securePassword = securePassword ? false : true;
                      });
                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 0),
              child: RaisedButton(
                child: Text('Submit'),
                onPressed: () async{
                  if (_formKey.currentState.validate()){

                    dynamic data = await Navigator.pushNamed(context, '/dataScreen', arguments: {
                      'email': emailController.text,
                      'password': passwordController.text,
                    });

                    setState(() {
                      emailController.text = data['email'];
                    });
                  }
                },
              ),
            )

          ],
        ),
      ),
    );
  }
}
