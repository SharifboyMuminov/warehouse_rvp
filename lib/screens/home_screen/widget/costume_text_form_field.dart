import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warehouse_rvp/utils/app_size.dart';
import 'package:warehouse_rvp/utils/app_text_style.dart';

class CostumeTextFormField extends StatelessWidget {
  const CostumeTextFormField({
    super.key,
    this.label,
    this.hintText,
    this.controller,
    this.onChanged,
    this.textInputAction,
    this.textInputType,
    this.maxLines = 1,
  });

  final String? label;
  final String? hintText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      textInputAction: textInputAction ?? TextInputAction.next,
      keyboardType: textInputType,
      onChanged: onChanged,
      controller: controller,
      cursorColor: Colors.black,
      style: AppTextStyle.nunitoSemiBold.copyWith(
        fontSize: 15.sp,
      ),
      decoration: InputDecoration(
        label: label != null
            ? Text(
                label!,
                style: AppTextStyle.nunitoMedium.copyWith(
                  fontSize: 12.sp,
                ),
              )
            : null,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: Colors.black,
            width: 1.we,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: Colors.black.withValues(alpha: 0.3),
            width: 1.we,
          ),
        ),
        hintText: hintText,
        hintStyle: AppTextStyle.nunitoMedium.copyWith(
          color: Colors.black.withValues(alpha: 0.5),
          fontSize: 15.sp,
        ),
      ),
    );
  }
}
