import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warehouse_rvp/data/models/product_model.dart';
import 'package:warehouse_rvp/utils/app_size.dart';
import 'package:warehouse_rvp/utils/app_text_style.dart';

class HomeItem extends StatelessWidget {
  const HomeItem({
    super.key,
    required this.onTab,
    required this.productModel,
  });

  final VoidCallback onTab;
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(10.we),
        margin: EdgeInsets.symmetric(vertical: 8.he, horizontal: 10.we),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: Colors.white,
          border: Border.all(
            color: Colors.black87,
            width: 1.we,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 10,
              spreadRadius: 0,
              offset: Offset(0, 10),
            )
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (productModel.imagePath.isNotEmpty) ...[
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: productModel.imagePath.isNotEmpty &&
                        File(productModel.imagePath).existsSync()
                    ? Image.file(
                        File(productModel.imagePath),
                        width: 110.we,
                        height: 110.we,
                        fit: BoxFit.cover,
                      )
                    : const SizedBox(), // Agar rasm yo'q bo'lsa, bo'sh joy
              ),
              5.getW(),
            ],
            Expanded(
              child: Text(
                productModel.productName,
                style: AppTextStyle.nunitoMedium.copyWith(
                  fontSize: 16.sp,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
