import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:uzauto/AppPages.dart';
import 'package:uzauto/AppRoutes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'uzauto',
      getPages: AppPages.routes,
      initialRoute: AppRoutes.AUTH,
    );
  }
}
