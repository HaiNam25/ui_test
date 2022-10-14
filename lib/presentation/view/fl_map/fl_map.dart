import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import 'flutter_map_ex_control.dart';
import 'marker_controller.dart';
import 'polygon_controller.dart';

class FlMap extends StatefulWidget {
  final MiddlePolygonController polygonController;
  final MiddleMarkerController markerController;

  FlMap({required this.polygonController, required this.markerController});

  @override
  FlMapState createState() => FlMapState();
}

class FlMapState extends State<FlMap> {
  final MiddleFlMapExControl middleFlMapExControl = FlMapExControl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(20.92335669088932, 105.78998610377312),
          zoom: 10,
        ),
        mapController: FlMapExControl.mapController,
        children: [
          TileLayer(
            urlTemplate:
            'http://{s}.google.com/vt/lyrs=p&x={x}&y={y}&z={z}',
            subdomains: ['mt0', 'mt1', 'mt2', 'mt3'],
            // userAgentPackageName: 'dev.fleaflet.flutter_map.example',
          ),
          StreamBuilder<Polygon>(
            stream: widget.polygonController.setPolygonStream.stream,
            builder: (context, AsyncSnapshot<Polygon> snapshot) {
              return PolygonLayer(
                polygons: [
                  snapshot.data ?? Polygon(points: [LatLng(51.5, -0.09)], isFilled: true,
                    color: Colors.purple,
                    borderColor: Colors.purple,
                    borderStrokeWidth: 4,
                  )
                ],
              );
            },
          ),
          StreamBuilder<Set<Marker>>(
            stream: widget.markerController.setMarker.stream,
            builder: (context, AsyncSnapshot<Set<Marker>> snapshot) {
              if (snapshot.hasData) {
                return MarkerLayer(
                  markers: snapshot.data!.toList(),
                );
              }
              return SizedBox.shrink();
            },
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10, right: 10),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: 15,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        middleFlMapExControl.zoomIn();
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(color: Colors.grey),
                        child: Center(
                          child: Icon(Icons.add),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      onTap: () {
                        middleFlMapExControl.zoomOut();
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(color: Colors.grey),
                        child: Center(
                          child: Icon(Icons.remove),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
