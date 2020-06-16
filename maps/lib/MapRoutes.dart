import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_map_polyline/google_map_polyline.dart';
import 'package:permission/permission.dart';

class MapRoutes extends StatefulWidget{


  @override
  State createState() {
    return MapRoutesState();
  }
}

class MapRoutesState extends State<MapRoutes>{

  GoogleMapController mapController;

  double CAMERA_ZOOM = 17;
  LatLng SOURCE_LOCATION = LatLng(33.6671166,73.0892122);
  LatLng DEST_LOCATION = LatLng(33.6555791,73.0956066);
  Set<Marker> mapMarkers = {};
  Set<Polyline> polylines = {};
  List<LatLng> routeCoordinates = List();
  GoogleMapPolyline googleMapPolyline = GoogleMapPolyline(apiKey: 'AIzaSyD9U-R-3dhKjC5mvKdEObCPMTjRBUk0Tv4');

  void getPolylines() async{

    var permission = await Permission.getPermissionsStatus([PermissionName.Location]);

    if ( permission[0].permissionStatus == PermissionStatus.notAgain){
      var askPermission = await Permission.requestPermissions([PermissionName.Location]);
    }else {
      print('-----------------------------------------------------------------');
      routeCoordinates = await googleMapPolyline.getCoordinatesWithLocation(
          origin: SOURCE_LOCATION,
          destination: DEST_LOCATION,
          mode: RouteMode.bicycling);


    }

  }
  void onMapCreated(GoogleMapController controller){

    setState(() {
      mapController = controller;
      polylines.add(Polyline(
        polylineId: PolylineId('route 1'),
        points: routeCoordinates,
        visible: true,
        width: 40,
        color: Colors.red,
        startCap: Cap.roundCap,
        endCap: Cap.buttCap,
      )
      );

      mapMarkers.add(Marker(
        markerId: MarkerId(SOURCE_LOCATION.toString()),
        position: SOURCE_LOCATION,
        icon: BitmapDescriptor.defaultMarker,
      ));
      mapMarkers.add(Marker(
        markerId: MarkerId(DEST_LOCATION.toString()),
        position: DEST_LOCATION,
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPolylines();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: onMapCreated,
            initialCameraPosition: CameraPosition(
              target: SOURCE_LOCATION,
              zoom: CAMERA_ZOOM,
            ),
            mapType: MapType.normal,
            polylines: polylines,
            markers: mapMarkers,
          )
        ],
      ),
    );
  }

}