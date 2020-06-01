import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

void main() => runApp(new MaterialApp(home: PositionedTiles()));

class PositionedTiles extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PositionedTilesState();
}

class PositionedTilesState extends State<PositionedTiles> {
  List<Widget> tiles = [
    Padding(
      key: UniqueKey(),
      padding: const EdgeInsets.all(8.0),
      child: StatelessColorfulTile(),
    ),
    Padding(
      key: UniqueKey(),
      padding: const EdgeInsets.all(8.0),
      child: StatelessColorfulTile(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: tiles),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.sentiment_very_satisfied), onPressed: swapTiles),
    );
  }

  swapTiles() {
    setState(() {
      tiles.insert(0, tiles.removeAt(1));
    });
  }
}

class StatelessColorfulTile extends StatefulWidget {
  StatelessColorfulTile({Key key}): super(key: key);
  @override
  _StatelessColorfulTileState createState() => _StatelessColorfulTileState();
}

class _StatelessColorfulTileState extends State<StatelessColorfulTile> {
  Color myColor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myColor = RandomColor().randomColor();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: myColor, child: Padding(padding: EdgeInsets.all(70.0)));
  }
}