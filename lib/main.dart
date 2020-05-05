import 'package:apk01/src/pages/alert_page.dart';
import 'package:apk01/src/routes/routes.dart';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/',
      routes: getAplicationRoutes(),
      onGenerateRoute: (RouteSettings setting) {
          return MaterialPageRoute(
            builder: (context ) => AlertPage()
          );
      },
    );
  }
}
