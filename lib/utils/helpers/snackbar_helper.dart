import 'package:flutter/material.dart';
import 'package:machinetestpkd/config/ui_themes/app_colors.dart';
import 'package:machinetestpkd/config/ui_themes/app_style.dart';

showSnackBar({
  required String message,
  required BuildContext context,
  bool isError = false,
}) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: isError ? AppColors.redAccent : AppColors.green,
      content: Text(
        message,
        style: AppStyles.normalText,
      ),
    ),
  );
}
