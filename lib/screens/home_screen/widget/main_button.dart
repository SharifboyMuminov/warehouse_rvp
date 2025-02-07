import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warehouse_rvp/utils/app_size.dart';
import 'package:warehouse_rvp/utils/app_text_style.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    this.onTab,
    this.title = "",
    this.titleSize = 18,
  });

  final VoidCallback? onTab;
  final String title;
  final int titleSize;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.amber,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        padding: EdgeInsets.symmetric(vertical: 8.he, horizontal: 10.we),
      ),
      onPressed: onTab,
      child: Text(
        title,
        style: AppTextStyle.nunitoSemiBold.copyWith(
          color: Colors.white,
          fontSize: titleSize.sp,
        ),
      ),
    );
  }
}
