import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gutenberg/presentation/pages/home_page.dart';
import 'package:gutenberg/presentation/theme/theme_data.dart';

main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeData,
        home: HomePage());
  }
}
