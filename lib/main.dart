import 'package:flutter/services.dart';
import 'package:pindias_app/homepage.dart';
import 'package:pindias_app/presentation/view/filter/filter.dart';
import 'package:flutter/material.dart';

import 'presentation/view/community/ui/test_page.dart';
import 'presentation/view/real_estate_detail/ui/real_estate_detail_page.dart';

void main() {
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //     statusBarColor: Colors.purple,
  // ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // on below line we are specifying title of our app
      title: 'GFG',
      // on below line we are hiding debug banner
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // on below line we are specifying theme
        primarySwatch: Colors.green,
      ),
      // First screen of our app
      home: const RealStateDetailPage(),
      // home: FilterPage(),
      // home: const PolygonPage(),
    );
  }
}
