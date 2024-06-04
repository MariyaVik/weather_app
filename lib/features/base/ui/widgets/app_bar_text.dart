import 'package:flutter/material.dart';

import '../../../../common/theme/app_colors.dart';
import '../../../../common/theme/app_text_style.dart';

class AppBarText extends StatelessWidget {
  const AppBarText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Poppins().size12Weihtg400.copyWith(color: AppColors.black),
    );
  }
}
