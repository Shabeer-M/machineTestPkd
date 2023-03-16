import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:machinetestpkd/config/ui_themes/app_colors.dart';
import 'package:machinetestpkd/config/ui_themes/app_style.dart';
import 'package:machinetestpkd/utils/helpers/media_query_helper.dart';

Widget makeInput({
  required String label,
  bool obscureText = false,
  required TextInputAction textInputAction,
  String? Function(String?)? validator,
  required TextInputType textInputType,
  List<TextInputFormatter>? inputFormatters,
  required TextEditingController controller,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: AppStyles.labelText,
      ),
      height5,
      TextFormField(
        controller: controller,
        inputFormatters: inputFormatters,
        keyboardType: textInputType,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        textInputAction: textInputAction,
        obscureText: obscureText,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 10,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.grey,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.grey,
            ),
          ),
        ),
      ),
      height20,
      height10,
    ],
  );
}
