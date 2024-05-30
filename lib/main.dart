import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common/app.dart';
import 'common/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator.instance.init();
  await ScreenUtil.ensureScreenSize();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark, // для Android
      statusBarBrightness: Brightness.light, // для iOS
    ),
  );

  runApp(const App());
}
