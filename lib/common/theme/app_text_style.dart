import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class FontFamily {
  static const String poppins = 'Poppins';
}

class Poppins {
  TextStyle size12Weihtg400 = TextStyle(
    fontSize: 12.sp,
    fontFamily: FontFamily.poppins,
  );
  TextStyle size12Weihtg500 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    fontFamily: FontFamily.poppins,
  );
  TextStyle size14Weihtg400 = TextStyle(
    fontSize: 14.sp,
    fontFamily: FontFamily.poppins,
  );
  TextStyle size15Weihtg500 = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w500,
    fontFamily: FontFamily.poppins,
  );
  TextStyle size20Weihtg400 = TextStyle(
    fontSize: 20.sp,
    fontFamily: FontFamily.poppins,
  );
  TextStyle size24Weihtg500 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w500,
    fontFamily: FontFamily.poppins,
  );
}
