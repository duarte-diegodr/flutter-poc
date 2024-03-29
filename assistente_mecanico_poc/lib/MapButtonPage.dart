import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:assistente_mecanico_poc/detail.dart';
import 'page.dart';
import 'package:location/location.dart';

const LatLng _center = const LatLng(-19.920330, -43.920736);
LatLng current = _center;

class MapButtonPage extends Page {
  MapButtonPage() : super(const Icon(Icons.place), 'Map Button');

  @override
  Widget build(BuildContext context) {
    _getLocation();
    return MapButtonStateLess();
  }

  _getLocation() async {
    var location = new Location();
    try {
      await location.getLocation();
    } on Exception {}
    location.onLocationChanged().listen((LocationData currentLocation) {
      current = LatLng(currentLocation.latitude, currentLocation.longitude);
    });
  }
}

class MapButtonStateLess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MapButtonStateful(),
    );
  }
}

class MapButtonStateful extends StatefulWidget {
  @override
  _MapButtonState createState() => _MapButtonState();
}

class _MapButtonState extends State<MapButtonStateful> {
  Completer<GoogleMapController> _controller = Completer();

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    final GoogleMap map = GoogleMap(
        onMapCreated: _onMapCreated,
        myLocationEnabled: true,
        compassEnabled: true,
        indoorViewEnabled: true,
        markers: createMarkers(),
        initialCameraPosition: CameraPosition(
          target: current,
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
          _modalButtomSheet(context, "loja 1");
        });
    var marker2 = Marker(
        position: LatLng(-19.920230, -43.918315),
        infoWindow: InfoWindow(title: "Loja 2"),
        markerId: MarkerId("l2"),
        onTap: () {
          _modalButtomSheet(context, "loja 2");
        });
    var marker3 = Marker(
        position: LatLng(-19.920644, -43.922403),
        infoWindow: InfoWindow(title: "Loja 3"),
        markerId: MarkerId("l3"),
        onTap: () {
          _modalButtomSheet(context, "loja 3");
        });
    markers.add(marker1);
    markers.add(marker2);
    markers.add(marker3);

    return markers;
  }

  void _modalButtomSheet(BuildContext context, String title) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(
                      Icons.store,
                      color: Theme.of(context).primaryColor,
                    ),
                    title: new Text(title),
                    contentPadding: EdgeInsets.only(bottom: 20, left: 15),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Detail(title: title)),
                      );
                    }),
              ],
            ),
          );
        });
  }
}
