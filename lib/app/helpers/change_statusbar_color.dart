import 'package:flutter/services.dart';

void setStatusBarColor(Color color) {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: color,
      statusBarIconBrightness: color.computeLuminance() > 0.5 ? Brightness.dark : Brightness.light,
    ),
  );
}
