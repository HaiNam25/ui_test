import 'dart:typed_data';
import 'package:pindias_app/presentation/common_widget/loading_data.dart';
import 'package:pindias_app/presentation/view/drawing/controller/writing_control.dart';
import 'package:pindias_app/presentation/view/drawing/drawing.dart';
import 'package:pindias_app/presentation/view/gg_map/GoogleMapExControl.dart';
import 'package:pindias_app/presentation/view/gg_map/marker_control.dart';
import 'package:pindias_app/presentation/view/gg_map/polygon_control.dart';
import 'package:pindias_app/shared/utils/Uint8ListUtil.dart';
import 'package:pindias_app/shared/utils/format_text_to_number.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'domain/entities/category.dart';
import 'domain/entities/coordinates_ggmap.dart';
import 'domain/entities/path_curve.dart';
import 'domain/entities/real_estate.dart';
import 'presentation/common_widget/buttonlv.dart';

class WritingView extends StatefulWidget {
  final MiddlePolygonControl polygonControl;
  final MiddleMarkerControl markerControl;

  const WritingView({
    Key? key,
    required this.polygonControl,
    required this.markerControl,
  }) : super(key: key);

  @override
  _WritingView createState() => _WritingView();
}

class _WritingView extends State<WritingView> {
  final MiddleWritingControl middleWritingControl = WritingControl();
  final FormatTextToNumber formatTextToNumber = FormatTextToNumber();

  final MiddleGoogleMapExControl googleMapExControl = GoogleMapExControl();

  bool isDraw = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    middleWritingControl.dispose();
  }

  void _onPanEnd(DragEndDetails dragEndDetails, BuildContext context) async {
    if (isDraw) {
      List<Offset> paths = middleWritingControl.currentLine.path ?? [];
      double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;

      if (paths.isNotEmpty) {
        await widget.polygonControl.convertOffsetToLatLng(
            devicePixelRatio: devicePixelRatio, shape: paths);
        PathCurve pathCurve = PathCurve(paths: []);
        await Future.forEach(widget.polygonControl.polygons, (Polygon element) {
          for (var e in element.points) {
            pathCurve.paths!
                .add(CoordinatesGoogleMap(lat: e.latitude, lng: e.longitude));
          }
        });

        googleMapExControl.getPolygonIdByListLatLng(pathCurve: pathCurve);
      }
    }
    setState(() {
      isDraw = false;
    });
  }

  void _addMarker(Category<RealEstate> category) async {
    BitmapDescriptor? customIcon;
    List<RealEstate> contents = category.content ?? [];
    for (var element in contents) {
      if (element.isHasId && element.isCanCreateLatLng) {
        Uint8List byteData = await Uint8ListUtil.getBytesFromCanvas(
            200, 70,
            text: formatTextToNumber.compactMoney(money: element.price));
        customIcon = BitmapDescriptor.fromBytes(byteData);

        final marker = Marker(
            markerId: MarkerId(element.id!.toString()),
            position: LatLng(
              element.getLatitude,
              element.getLongitude,
            ),
            icon: customIcon,
            onTap: () {});
        widget.markerControl.addNewMarker(
          marker: marker,
        );
      }
    }
  }

  void _clear() {
    widget.polygonControl.clear();
    middleWritingControl.clear();
    widget.markerControl.clear();
    googleMapExControl.setDefaultStreamValue();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Visibility(
          visible: isDraw,
          child: DrawingView(
            isShowPencil: true,
            middleWritingControl: middleWritingControl,
            onPanEnd: (dragEndDetails) {
              _onPanEnd(dragEndDetails, context);
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OnTapIcon(
                  icon: Icon(
                    isDraw ? Icons.call_missed_outgoing_rounded : Icons.draw,
                    color: Colors.black,
                  ),
                  onPress: () {
                    setState(() {
                      if (!isDraw) {
                        _clear();
                      }
                      isDraw = !isDraw;
                    });
                  },
                ),
                const SizedBox(
                  width: 10,
                  height: 10,
                ),
              ],
            ),
          ),
        ),
        StreamBuilder<String?>(
          stream: googleMapExControl.getPolygonId,
          builder: (context, snapshot) {
            if (snapshot.hasData && googleMapExControl.isHasGetPolygonId) {

              googleMapExControl.getAllDataByPolygonId(polygonId: snapshot.data!);

              return StreamBuilder<Category<RealEstate>?>(
                stream: googleMapExControl.getCategory,
                builder: (context, category) {
                  if (category.hasData) {
                    _addMarker(category.data!);
                    return const SizedBox.shrink();
                  }
                  return LoadingData();
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
