import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(),
    );
  }
}

class FireMap extends StatefulWidget{
  State createState() => FireMapState();
}

class FireMapState extends State<FireMap>{
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(27.2038, 77.5011),
            zoom: 15
          ),
  //         onMapCreated: _onMapCreated,
        )
      ],
    );
  }

  //_onMapCreated(GoogleMapController controller){
  //  setState(() {
  //    mapController = controller;
  //  });
  //}

}