import 'package:flutter/painting.dart';

class AppShadow {
  static const BoxShadow shadow1 = BoxShadow(
      color: Color.fromARGB(5, 0, 0, 0), blurRadius: 3, offset: Offset(0, 7));
  static const BoxShadow menubar = BoxShadow(
      color: Color.fromARGB(5, 0, 0, 0), blurRadius: 15, offset: Offset(0, -7));
}
