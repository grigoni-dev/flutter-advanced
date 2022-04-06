import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' as services;
import 'package:lezione3/repository/google_map_places.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Completer<GoogleMapController> mapController = Completer();
  final Set<Marker> gMarkers = {};
  final Set<Circle> gCircles = {};

  @override
  void initState() {
    setState(() {
      gMarkers.add(
        Marker(
          markerId: MarkerId("Casa Rigoni"),
          position: LatLng(45.76003872650943, 12.58345861179656),
          infoWindow: InfoWindow(title: "Questa è la casa della famiglia rigoni"),
        ),
      );

      gCircles.add(
        Circle(
          circleId: CircleId("Duomo di Motta"),
          center: LatLng(45.775999218520404, 12.611557066924112),
          radius: 10,
          visible: true,
          strokeColor: Colors.blue,
          strokeWidth: 1,
          fillColor: Colors.blue.withOpacity(0.3),
        ),
      );
    });

    super.initState();
  }

  void gotoPlace() async {
    final controller = await mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(GoogleMapPlaces.duomoPosition));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Maps"),
      ),
      body: GoogleMap(
        markers: gMarkers,
        circles: gCircles,
        zoomControlsEnabled: false,
        onMapCreated: (controller) async {
          mapController.complete(controller);
          var loadString = await services.rootBundle.loadString("assets/json/google_map_style.json");
          controller.setMapStyle(loadString); // assegno il controller a mapController
        }, // mapType: MapType.satellite,
        initialCameraPosition: GoogleMapPlaces.homePosition,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: gotoPlace,
        icon: Icon(Icons.map_outlined),
        label: Text("Vai al Duomo"),
      ),
    );
  }
}
