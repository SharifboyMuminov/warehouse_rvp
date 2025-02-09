import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:warehouse_rvp/data/models/product_model.dart';
import 'package:warehouse_rvp/utils/app_size.dart';
import 'package:warehouse_rvp/utils/app_text_style.dart';

class ShowSumItem extends StatelessWidget {
  const ShowSumItem({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.he, bottom: 15.he),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Mahsulot nomi: ",
                style: AppTextStyle.nunitoMedium.copyWith(
                  fontSize: 14.sp,
                ),
              ),
              Expanded(
                child: Text(
                  productModel.productName,
                  style: AppTextStyle.nunitoBold.copyWith(
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ],
          ),
          5.getH(),
          Row(
            children: [
              Text(
                "Mahsulot qrCode: ",
                style: AppTextStyle.nunitoMedium.copyWith(
                  fontSize: 14.sp,
                ),
              ),
              Expanded(
                child: Text(
                  productModel.qrCode,
                  style: AppTextStyle.nunitoBold.copyWith(
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ],
          ),
          5.getH(),
          Row(
            children: [
              Text(
                "Mahsulot soni: ",
                style: AppTextStyle.nunitoMedium.copyWith(
                  fontSize: 14.sp,
                ),
              ),
              Expanded(
                child: Text(
                  productModel.count.toString(),
                  style: AppTextStyle.nunitoBold.copyWith(
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ],
          ),
          5.getH(),
          Row(
            children: [
              Text(
                "Mahsulot narhi: ",
                style: AppTextStyle.nunitoMedium.copyWith(
                  fontSize: 14.sp,
                ),
              ),
              Expanded(
                child: Text(
                  productModel.price.toString(),
                  style: AppTextStyle.nunitoBold.copyWith(
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ],
          ),
          Text(
            "-" * 100,
            maxLines: 1,
            style: AppTextStyle.nunitoRegular.copyWith(
              fontSize: 12.sp,
              color: Colors.grey,
            ),
          ),
          Text(
            NumberFormat("#,##0.00", "uz_UZ")
                .format(productModel.count * productModel.price),
            style: AppTextStyle.nunitoMedium.copyWith(
              fontSize: 16.sp,
            ),
          ),
        ],
      ),
    );
  }
}
