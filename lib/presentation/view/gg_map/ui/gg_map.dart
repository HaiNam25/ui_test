import 'dart:collection';

import 'package:custom_info_window/custom_info_window.dart';
import 'package:pindias_app/presentation/view/gg_map/GoogleMapExControl.dart';
import 'package:pindias_app/presentation/view/gg_map/marker_control.dart';
import 'package:pindias_app/presentation/view/gg_map/polygon_control.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapEx extends StatefulWidget {
  final MiddlePolygonControl polygonControl;
  final MiddleMarkerControl markerControl;

  const GoogleMapEx({Key? key, required this.polygonControl, required this.markerControl,}) : super(key: key);

  @override
  GoogleMapExState createState() => GoogleMapExState();
}

class GoogleMapExState extends State<GoogleMapEx> {
  static CameraPosition? _kGoogle = const CameraPosition(
    target: LatLng(20.92335669088932, 105.78998610377312),
    zoom: 10,
  );
  final Set<Polygon> _polygon = HashSet<Polygon>();

  late GoogleMapController _controller;

  final CustomInfoWindowController _customInfoWindowController =
  CustomInfoWindowController();

  @override
  void initState() {
    super.initState();

    _polygon.add(
        Polygon(
          polygonId: PolygonId('default_polygon'),
          points: const [LatLng(0, 0),],
          fillColor: Colors.green.withOpacity(0.3),
          strokeColor: Colors.green,
          geodesic: true,
          strokeWidth: 1,
        )
    );

  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        StreamBuilder<Set<Polygon>>(
            stream: widget.polygonControl.setPolygons.stream,
            initialData: _polygon,
            builder: (context, AsyncSnapshot<Set<Polygon>> polygonData) {
              return StreamBuilder<Set<Marker>>(
                  stream: widget.markerControl.setMarker.stream,
                  builder: (context, AsyncSnapshot<Set<Marker>> markerData) {
                    return GoogleMap(
                      initialCameraPosition: _kGoogle ?? const CameraPosition(
                        target: LatLng(0, 0),
                        zoom: 1,
                      ),
                      mapType: MapType.normal,
                      myLocationEnabled: true,
                      myLocationButtonEnabled: true,
                      compassEnabled: true,
                      tiltGesturesEnabled: true,
                      polygons: polygonData.data!,
                      markers: markerData.data ?? const <Marker>{},
                      onMapCreated: (GoogleMapController controller){
                        _customInfoWindowController.googleMapController = controller;
                        GoogleMapExControl.getInstance.initCustomInfoWindowController(_customInfoWindowController);
                      },
                      onCameraMove: (position) {
                        GoogleMapExControl.getInstance.customInfoWindowController?.onCameraMove!();
                      },
                      onTap: (latLng) {
                        // print("latLng: $latLng");
                        // widget.polygonControl.addNewPolygon(latLng: latLng);
                      },
                    );
                  }
              );
            }
        ),
        CustomInfoWindow(
          controller: _customInfoWindowController,
          height: 40,
          width: 80,
          offset: 30,
        ),
      ],
    );
  }
}