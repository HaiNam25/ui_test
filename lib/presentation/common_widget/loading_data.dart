import 'dart:async';

import 'package:flutter/material.dart';

class LoadingData extends StatefulWidget {
  final Widget? insteadWidget;

  LoadingData({
    this.insteadWidget,
  });

  @override
  LoadingDataState createState() => LoadingDataState();
}

class LoadingDataState extends State<LoadingData> {
  late Timer _timer;
  int _start = 5;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _start > 0
        ? LoadingWidget()
        : (widget.insteadWidget != null
        ? widget.insteadWidget!
        : Center(child: Text('have no data')));
  }
}

class LoadingWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 60,
        height: 60,
        child: CircularProgressIndicator(
          strokeWidth: 6,
        ),
      ),
    );
  }
}
