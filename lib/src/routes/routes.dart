import 'package:apk01/src/pages/alert_page.dart';
import 'package:apk01/src/pages/animated_container.dart';
import 'package:apk01/src/pages/avartar_page.dart';
import 'package:apk01/src/pages/card_page.dart';
import 'package:apk01/src/pages/home_page.dart';
import 'package:apk01/src/pages/inputs_page.dart';
import 'package:apk01/src/pages/listview_page.dart';
import 'package:apk01/src/pages/slider_page.dart';
import 'package:flutter/material.dart';


Map<String, WidgetBuilder> getAplicationRoutes() {
  return <String, WidgetBuilder>{
    '/'         : (BuildContext context) => HomePage(),
    'alert'     : (BuildContext context) => AlertPage(),
    'avatar'    : (BuildContext context) => AvatarPage(),
    'card'      : (BuildContext context) => CardPage(),
    'animation' :  (BuildContext context) => AnimatedContainerPage(),
    'inputs' :  (BuildContext context) => InputPage(),
    'slider' :  (BuildContext context) => SliderPage(),
    'list' :  (BuildContext context) => ListViewPage(),
  };
}