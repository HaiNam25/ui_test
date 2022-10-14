import 'package:flutter/material.dart';

import 'message_border.dart';

class CustomInfoWindowMap extends StatefulWidget {
  final Widget? child;

  const CustomInfoWindowMap({
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  CustomInfoWindowMapState createState() => CustomInfoWindowMapState();
}

class CustomInfoWindowMapState extends State<CustomInfoWindowMap> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 120,
      decoration: const ShapeDecoration(
        color: Color.fromRGBO(115, 21, 100, 0.8),
        shape: MessageBorder(),
        shadows: [
          // BoxShadow(color: Color.fromRGBO(115, 21, 100, 1), blurRadius: 4.0, offset: Offset(2, 2)),
        ],
      ),
      //padding: EdgeInsets.only(right: 8),
      child: Center(child: widget.child),
    );
  }
}
