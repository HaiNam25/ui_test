import 'package:pindias_app/presentation/common_widget/loading_data.dart';
import 'package:pindias_app/presentation/view/drawing/controller/writing_control.dart';
import 'package:pindias_app/presentation/view/drawing/drawing.dart';
import 'package:pindias_app/presentation/view/fl_map/flutter_map_ex_control.dart';
import 'package:pindias_app/presentation/view/fl_map/marker_controller.dart';
import 'package:pindias_app/presentation/view/fl_map/polygon_controller.dart';
import 'package:pindias_app/presentation/view/gg_map/components/message_border.dart';
import 'package:pindias_app/shared/utils/format_text_to_number.dart';
import 'package:pindias_app/shared/utils/polygon_utils.dart';
import 'package:flutter/material.dart';

import 'domain/entities/category.dart';
import 'domain/entities/coordinates_ggmap.dart';
import 'domain/entities/path_curve.dart';
import 'domain/entities/real_estate.dart';
import 'presentation/common_widget/buttonlv.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class WritingViewFlMap extends StatefulWidget {
  final MiddlePolygonController polygonControl;
  final MiddleMarkerController markerController;

  const WritingViewFlMap({
    Key? key,
    required this.polygonControl,
    required this.markerController,
  }) : super(key: key);

  @override
  _WritingViewFlMap createState() => _WritingViewFlMap();
}

class _WritingViewFlMap extends State<WritingViewFlMap> {
  final MiddleWritingControl middleWritingControl = WritingControl();
  final FormatTextToNumber formatTextToNumber = FormatTextToNumber();
  final MiddleFlMapExControl middleFlMapExControl = FlMapExControl();

  bool isDraw = false;
  bool isZoom = false;

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
        widget.polygonControl.clear();
        await widget.polygonControl.convertOffsetToLatLng(
            devicePixelRatio: devicePixelRatio, shape: paths);

        PathCurve pathCurve = PathCurve(paths: []);
        await Future.forEach(widget.polygonControl.currentPolygon.points,
            (LatLng element) {
          pathCurve.paths!.add(
            CoordinatesGoogleMap(lat: element.latitude, lng: element.longitude),
          );
        });
        middleFlMapExControl.getPolygonIdByListLatLng(pathCurve: pathCurve);

        CoordinatesGoogleMap? centerPolygon =
            PolygonUtils.getCenterPolygon(points: pathCurve.paths);
        middleFlMapExControl.zoomTo(
          center: centerPolygon == null
              ? null
              : LatLng(centerPolygon.lat!, centerPolygon.lng!),
        );
      }
    }
    setState(() {
      isDraw = false;
    });
  }

  void _addMarker(Category<RealEstate> category) {
    for (RealEstate element in category.content ?? []) {
      if (element.isHasId && element.isCanCreateLatLng) {
        isZoom = true;
        final marker = Marker(
          point: LatLng(
            element.getLatitude,
            element.getLongitude,
          ),
          builder: (context) {
            return Container(
              decoration: ShapeDecoration(
                shape: MessageBorder(),
                color: const Color.fromRGBO(115, 21, 100, 0.8),
              ),
              child: Center(
                child: Text(
                  formatTextToNumber.compactMoney(money: element.price),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            );
          },
          width: 70,
        );
        widget.markerController.addNewMarker(
          marker: marker,
        );
      }
    }
  }

  void _zoom(Category<RealEstate> category) {
    int index = category.content!.length ~/ 2;
    final LatLng zoomPoint = LatLng(category.content![index].getLatitude,
        category.content![index].getLongitude);
    middleFlMapExControl.zoomTo(center: zoomPoint);
  }

  void _clear() {
    widget.markerController.clear();
    widget.polygonControl.clear();
    middleFlMapExControl.setDefaultStreamValue();
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
          stream: middleFlMapExControl.getPolygonId,
          builder: (context, snapshot) {
            if (snapshot.hasData && middleFlMapExControl.isHasGetPolygonId) {
              middleFlMapExControl.getAllDataByPolygonId(
                  polygonId: snapshot.data!);

              return StreamBuilder<Category<RealEstate>?>(
                stream: middleFlMapExControl.getCategory,
                builder: (context, AsyncSnapshot<Category<RealEstate>?> category) {
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
