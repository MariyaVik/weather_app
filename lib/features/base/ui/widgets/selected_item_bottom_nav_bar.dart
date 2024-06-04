// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/theme/app_colors.dart';

class SelectedItemBottomNavBar extends StatelessWidget {
  const SelectedItemBottomNavBar({
    super.key,
    required this.icon,
  });

  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      width: 60.w,
      height: 44.h,
      decoration: BoxDecoration(
          color: AppColors.black, borderRadius: BorderRadius.circular(12)),
      child: SvgPicture.asset(
        icon,
        color: AppColors.white,
      ),
    );
  }
}
