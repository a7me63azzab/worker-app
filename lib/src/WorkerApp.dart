import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workerapp/src/Screens/HomeScreen/view.dart';

import 'Utils/ColorsTransform.dart';

class WorkerApp extends StatefulWidget {
  WorkerApp({Key key}) : super(key: key);

  @override
  _WorkerAppState createState() => _WorkerAppState();
}

class _WorkerAppState extends State<WorkerApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        cursorColor:  Color(getColorHexFromStr("d63447")),
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: Color(getColorHexFromStr("d63447")),
          ),
        ),
        iconTheme: IconThemeData(
          color: Color(getColorHexFromStr("d63447")),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
