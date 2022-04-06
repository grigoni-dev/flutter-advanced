import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:progetto3/model/city_model.dart';
import 'package:flutter/services.dart' as services;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Completer<GoogleMapController> mapController = Completer();

  Set<Circle> circles = {};
  Set<Marker> markers = {};
  List<CityModel> filteredCities = [];

  @override
  void initState() {
    filteredCities = CityModel.cities;

    setState(() {
      markers = CityModel.cities
          .map((e) => Marker(
                markerId: MarkerId(e.text),
                position: e.coordinates,
                infoWindow: InfoWindow(title: e.text),
              ))
          .toSet();

      circles = CityModel.cities
          .map((e) => Circle(
                circleId: CircleId(e.text),
                center: e.coordinates,
                radius: 500,
                visible: true,
                strokeColor: Colors.blue,
                strokeWidth: 1,
                fillColor: Colors.blue.withOpacity(0.3),
              ))
          .toSet();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            body(),
            searchBar(),
          ],
        ),
      ),
    );
  }

  Widget searchBar() {
    return FloatingSearchBar(
      closeOnBackdropTap: true,
      onQueryChanged: onQueryChanged, // (query) => onQueryChanged(query)
      hint: "Dove vuoi andare?",
      builder: (context, transition) => ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Material(
          color: Colors.white,
          elevation: 4.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              filteredCities.length,
              (index) => ListTile(
                title: Text(
                  filteredCities[index].text,
                ),
                onTap: () {
                  gotoPlace(filteredCities[index].coordinates);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget body() {
    return Expanded(
      child: GoogleMap(
        zoomGesturesEnabled: false,
        myLocationEnabled: false,
        circles: circles,
        markers: markers,

        onMapCreated: (controller) async {
          final mapStyle = await services.rootBundle.loadString("assets/json/google_map_style.json");
          controller.setMapStyle(mapStyle); // assegno il controller a mapController
          mapController.complete(controller);
        }, // mapType: MapType.satellite,
        initialCameraPosition: CameraPosition(
          target: filteredCities[0].coordinates,
          zoom: 15,
        ),
      ),
    );
  }

  void gotoPlace(LatLng coordinates) async {
    final controller = await mapController.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: coordinates,
          zoom: 15,
        ),
      ),
    );
  }

  void onQueryChanged(String query) {
    setState(() {
      filteredCities = CityModel.cities
          .where(
            (element) => element.text.toLowerCase().contains(
                  query.toLowerCase(),
                ),
          )
          .toList();
    });
  }
}
