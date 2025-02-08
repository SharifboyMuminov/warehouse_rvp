import 'package:flutter/cupertino.dart';
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
    this.isActive = true,
    this.isLoading = false,
  });

  final VoidCallback? onTab;
  final String title;
  final int titleSize;
  final bool isActive;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Colors.amber;
    VoidCallback? currentOnTab = onTab;

    if (isLoading || (!isActive)) {
      backgroundColor = Colors.black38;
      currentOnTab = null;
    }

    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        padding: EdgeInsets.symmetric(vertical: 8.he, horizontal: 10.we),
      ),
      onPressed: currentOnTab,
      child: isLoading
          ? CupertinoActivityIndicator(
              color: Colors.white,
            )
          : Text(
              title,
              style: AppTextStyle.nunitoSemiBold.copyWith(
                color: Colors.white,
                fontSize: titleSize.sp,
              ),
            ),
    );
  }
}
