import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps/MapRoutes.dart';

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
        primaryColor: Colors.greenAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MapRoutes(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Set<Marker> markers = {};
  Completer<GoogleMapController> _mapController = Completer();
  MapType _currentMapType = MapType.normal;
  IconData buttonIcon = Icons.satellite;
  static const LatLng _center = const LatLng(33.6343576, 73.1231582);
  BitmapDescriptor mapMarker;
  LatLng _lastLocation = _center;

  @override
  void initState() {
    super.initState();

  }

  void _onMapCreated(GoogleMapController controller){
    _mapController.complete(controller);

  }

  void _onCameraMove(CameraPosition position){

    _lastLocation = position.target;
  }

  void addmarker(position){
    setState(() {
      markers.add(Marker(
          markerId: MarkerId(position.toString()),
          position: position,
          icon: mapMarker,
      ));
    });
  }
  void _onAddmarkerButtonPressed(){
    setState(() {
      markers.add(Marker(
        markerId: MarkerId(_lastLocation.toString()),
        position: _lastLocation,
        infoWindow: InfoWindow(
          title: 'New Location',
          snippet: 'This place is great!'
        ),
        icon: mapMarker,
      ));
    });
  }
  @override
  Widget build(BuildContext context) {
    ImageConfiguration configuration = createLocalImageConfiguration(context);
    BitmapDescriptor.fromAssetImage(configuration, 'Assets/marker.png').then(
            (value) {
          mapMarker = value;
        });
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: _onMapCreated,
              mapType: _currentMapType,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
              markers: markers,
              onCameraMove: _onCameraMove,
              onTap: addmarker,
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
            ),
            Align(
                alignment: Alignment.topCenter,
                child: CustomAppBar(),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FloatingActionButton(
                    child: Icon(
                        buttonIcon
                    ),
                    backgroundColor: Colors.blueGrey,
                    onPressed: (){
                      setState(() {
                        _currentMapType = _currentMapType == MapType.normal ? MapType.satellite : MapType.normal;
                        buttonIcon = buttonIcon == Icons.map ? Icons.satellite : Icons.map;
                      });
                    },
                  ),
                  FloatingActionButton(
                    child: Icon(
                        Icons.add,
                    ),
                    backgroundColor: Colors.blue,
                    onPressed: _onAddmarkerButtonPressed,
                  ),
                ],
              ),
            )
          ],
        ),
        drawer: Drawer(),
      ),
    );
  }
}


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      height: 50.0,
      margin: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
      child: AppBar(
        title: Text('Careem'),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.0);

}