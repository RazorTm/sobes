import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../modules/session/view/session_view.dart';
import '../utils/bindings.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Session App',
      debugShowCheckedModeBanner: false,
      initialBinding: SessionBinding(),
      home: const SessionScreen(),
    );
  }
}