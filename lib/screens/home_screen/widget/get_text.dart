import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warehouse_rvp/utils/app_size.dart';
import 'package:warehouse_rvp/utils/app_text_style.dart';

class GetText extends StatelessWidget {
  const GetText({super.key, required this.title, required this.mainTitle});

  final String title;
  final String mainTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        10.getH(),
        Text(
          title,
          style: AppTextStyle.nunitoMedium.copyWith(
            fontSize: 14.sp,
          ),
        ),
        Text(
          mainTitle,
          style: AppTextStyle.nunitoSemiBold.copyWith(
            fontSize: 16.sp,
          ),
        ),
      ],
    );
  }
}
