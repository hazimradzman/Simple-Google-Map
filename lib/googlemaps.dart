import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMaps extends StatefulWidget {
  const GoogleMaps({Key? key}) : super(key: key);

  @override
  State<GoogleMaps> createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps> {

  final Completer<GoogleMapController> _controller = Completer(); // control the Google Map or Hovering the map

  static const CameraPosition initialPosition = CameraPosition(target: LatLng(2.9198, 101.7809), zoom: 14); // initial Maps coordinate

  static const CameraPosition targetPosition = CameraPosition(target: LatLng(2.928946562599909, 101.78002680761946), zoom: 14); //when click button , it will go to this coordinate

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (title: Text("Google Maps"),),
      body: GoogleMap(initialCameraPosition: initialPosition,mapType: MapType.normal,onMapCreated: (GoogleMapController controller){
        _controller.complete(controller);
      },),
      floatingActionButton: FloatingActionButton.extended(onPressed: (){
        goToUkm();
      }, label: Text("To UKM"),icon: Icon(Icons.school),),
    );
  }

  Future<void> goToUkm() async{
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(targetPosition));
  }
}
