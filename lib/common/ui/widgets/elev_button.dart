import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_text_style.dart';

class ElevButton extends StatelessWidget {
  const ElevButton({
    super.key,
    required this.child,
    this.callback,
    this.horizontalPadding,
  });
  final Widget child;
  final Function()? callback;
  final double? horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: callback,
        style: ButtonStyle(
          textStyle: WidgetStateProperty.all<TextStyle>(
            Poppins().size20Weihtg400,
          ),
          backgroundColor:
              WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return AppColors.greyLight.withOpacity(0.2);
            }
            return AppColors.black;
          }),
          foregroundColor:
              WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return AppColors.white.withOpacity(0.4);
            }
            return AppColors.white;
          }),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
          ),
          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
              EdgeInsets.symmetric(
                  horizontal:
                      horizontalPadding == null ? 40.w : horizontalPadding!.w)),
          fixedSize: WidgetStateProperty.all<Size>(Size.fromHeight(56.h)),
        ),
        child: child,
      ),
    );
  }
}
