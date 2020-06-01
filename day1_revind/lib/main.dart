import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Day 1 Revind'),
        automaticallyImplyLeading: true,
        leading: GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.menu,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.search,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(
              Icons.more_vert,
            ),
          )
        ],
      ),
      body: Center(
        child: Text(
          'Day 1 revind',
          style: TextStyle(
            fontSize: 30.0,
            fontFamily: 'IndieFlower'
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
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
                Icons.backup,

              ),
              title: Text('Backup')
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    ),
  ));
}
