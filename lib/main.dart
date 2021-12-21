import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      initialRoute: AppPage.kInitial,
      getPages: AppPage.routes,
    );
  }
}
