import 'package:pindias_app/presentation/view/drawing/controller/writing_control.dart';
import 'package:pindias_app/presentation/view/fl_map/fl_map.dart';
import 'package:pindias_app/presentation/view/fl_map/marker_controller.dart';
import 'package:pindias_app/presentation/view/fl_map/polygon_controller.dart';
import 'package:pindias_app/presentation/view/gg_map/marker_control.dart';
import 'package:pindias_app/presentation/view/gg_map/polygon_control.dart';
import 'package:pindias_app/writing_view_2.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MiddlePolygonControl polygonControl = PolygonControl();
  final MiddleMarkerControl markerControl = MarkerControl();
  final MiddlePolygonController middlePolygonController = PolygonController();
  final MiddleMarkerController middleMarkerController = MarkerController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    polygonControl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppBarControl.getSize(context);
    print(AppBarControl.heightAppbar);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0F9D58),
        // title of app
        title: Text("GFG"),
      ),
      body: Container(
        child: SafeArea(
          child: Stack(
            children: [
              // GoogleMapEx(polygonControl: polygonControl, markerControl: markerControl),
              // WritingView(polygonControl: polygonControl, markerControl: markerControl),
              FlMap(polygonController: middlePolygonController, markerController: middleMarkerController),
              WritingViewFlMap(polygonControl: middlePolygonController, markerController: middleMarkerController),
            ],
          ),
        ),
      ),
    );
  }
}
//
