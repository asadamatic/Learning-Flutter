import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  IconData searchIcon = Icons.search;
  Widget appBarTitle = Text('Search Bar');
  TextEditingController filterController = TextEditingController();
  InputDecoration searchDecoration = InputDecoration(hintText: 'Search here...', hintStyle: TextStyle(color: Colors.white), focusColor: Colors.white, enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)) );
  List<String> names = ['Asad', 'Ahsan', 'Muhammad', 'Talha'];
  List<String> filteredList = List();

  @override
  void initState() {
    super.initState();

    filteredList = names;
  }
  void searchList(String value){

    setState(() {

      if (value.isEmpty){

        filteredList = names;
      }else{

        List<String> temporaryList = List();

        for (int index = 0; index < filteredList.length; index++){
          if (filteredList[index].toLowerCase().contains(value.trim().toLowerCase())){
            temporaryList.add(filteredList[index]);
          }
        }

        filteredList = temporaryList;
      }

    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: appBarTitle,
        actions: <Widget>[
          IconButton(
            onPressed: (){
              setState(() {
                searchIcon = searchIcon == Icons.search ? Icons.close : Icons.search;
                appBarTitle = searchIcon == Icons.close ? TextField(style: TextStyle(color: Colors.white), controller: filterController, decoration: searchDecoration, onChanged: (value){ searchList(value);},) : Text('Search Bar');
              });
            },
            icon: Icon(
              searchIcon,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Column(

        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: filteredList.map((filteredName) => Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(filteredName),
        )).toList(),
      ),
    );
  }
}
