import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:assistente_mecanico_poc/detail.dart';
import 'page.dart';

//void main() => runApp(MaterialApp(title: 'home', home: MapMarkerStateLess()));

class MapMarkerPage extends Page {
  MapMarkerPage() : super(const Icon(Icons.place), 'Map Marker');

  @override
  Widget build(BuildContext context) {
    return MapMarkerStateLess();
  }
}

class MapMarkerStateLess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MapMarkerStateful());
  }
}

class MapMarkerStateful extends StatefulWidget {
  @override
  _MapMarkerState createState() => _MapMarkerState();
}

class _MapMarkerState extends State<MapMarkerStateful> {
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(-19.920330, -43.920736);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    final GoogleMap map = GoogleMap(
        onMapCreated: _onMapCreated,
        markers: createMarkers(),
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 16.0,
        ));
    return map;
  }

  Set<Marker> createMarkers() {
    Set<Marker> markers = {};
    var marker1 = Marker(
        position: LatLng(-19.918724, -43.921367),
        infoWindow: InfoWindow(
          title: "Loja 1",
        ),
        markerId: MarkerId("l1"),
        onTap: () {
          openDetail(context, "loja 1");
        });
    var marker2 = Marker(
        position: LatLng(-19.920230, -43.918315),
        infoWindow: InfoWindow(title: "Loja 2"),
        markerId: MarkerId("l2"),
        onTap: () {
          openDetail(context, "loja 2");
        });
    var marker3 = Marker(
        position: LatLng(-19.920644, -43.922403),
        infoWindow: InfoWindow(title: "Loja 3"),
        markerId: MarkerId("l3"),
        onTap: () {
          openDetail(context, "loja 3");
        });
    markers.add(marker1);
    markers.add(marker2);
    markers.add(marker3);

    return markers;
  }

  openDetail(BuildContext context, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Detail(title: title)),
    );
  }
}
