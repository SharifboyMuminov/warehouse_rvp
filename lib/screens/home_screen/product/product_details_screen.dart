import 'dart:io';

import 'package:animated_digit/animated_digit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:warehouse_rvp/bloc/product/product_bloc.dart';
import 'package:warehouse_rvp/bloc/product/product_event.dart';
import 'package:warehouse_rvp/data/models/product_model.dart';
import 'package:warehouse_rvp/screens/home_screen/product/show_image_full_screen.dart';
import 'package:warehouse_rvp/screens/home_screen/product/update_product.dart';
import 'package:warehouse_rvp/screens/home_screen/widget/get_text.dart';
import 'package:warehouse_rvp/screens/home_screen/widget/main_button.dart';
import 'package:warehouse_rvp/utils/app_size.dart';
import 'package:warehouse_rvp/utils/app_text_style.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late ProductModel productModel;

  @override
  void initState() {
    productModel = widget.productModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text(
          "Mahsulot tafsilotlari",
          style: AppTextStyle.nunitoBold.copyWith(
            fontSize: 20.sp,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return UpdateProductScreen(
                      productModel: widget.productModel,
                    );
                  },
                ),
              );
            },
            icon: Icon(
              Icons.edit,
              color: Colors.black,
              size: 20.we,
            ),
          ),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    title: Text(
                      "Mahsulotni rostan o'chirmoqchimisiz?",
                      textAlign: TextAlign.center,
                      style: AppTextStyle.nunitoBold.copyWith(
                        fontSize: 16.sp,
                      ),
                    ),
                    actions: [
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.amber,
                          padding: EdgeInsets.symmetric(
                            vertical: 5.he,
                            horizontal: 10.we,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        onPressed: () {
                          context.read<ProductBloc>().add(
                                ProductDeleteEvent(
                                  productModel,
                                ),
                              );
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Ha",
                          style: AppTextStyle.nunitoMedium.copyWith(
                            fontSize: 14.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(
              CupertinoIcons.delete,
              color: Colors.red,
              size: 20.we,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 10.we,
            vertical: 10.he,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (productModel.imagePath.isNotEmpty)
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return ShowImageFullScreen(
                                    imagePath: widget.productModel.imagePath,
                                  );
                                },
                              ),
                            );
                          },
                          child: Container(
                            width: 100.we,
                            height: 100.we,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: FileImage(
                                  File(widget.productModel.imagePath),
                                ),
                              ),
                            ),
                          ),
                        ),
                        10.getW(),
                        Expanded(
                          child: Text(
                            widget.productModel.productName * 10,
                            style: AppTextStyle.nunitoMedium.copyWith(
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "-" * 100,
                      maxLines: 1,
                      style: AppTextStyle.nunitoLight.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              if (productModel.imagePath.isEmpty) ...[
                GetText(
                  title: "Mahsulot nomi:",
                  mainTitle: productModel.productName,
                ),
              ],
              GetText(
                title: "Mahsulot narhi:",
                mainTitle: productModel.price.toString(),
              ),
              GetText(
                title: "Mahsulot soni:",
                mainTitle: productModel.count.toString(),
              ),
              GetText(
                title: "Mahsulot qrCodedi:",
                mainTitle: productModel.qrCode,
              ),
              GetText(
                title: "Mahsulot tafsilotlari:",
                mainTitle: productModel.description,
              ),
              10.getH(),
              Text(
                "-" * 100,
                maxLines: 1,
                style: AppTextStyle.nunitoLight.copyWith(
                  color: Colors.grey,
                ),
              ),
              GetText(
                title: "Mahsulot umumiy hisobda:",
                mainTitle: NumberFormat("#,##0.00", "uz_UZ")
                    .format(
                      productModel.count * productModel.price,
                    )
                    .toString(),
              ),
              20.getH(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (productModel.count > 1) {
                        setState(() {
                          productModel = productModel.copyWith(
                              count: productModel.count - 1);
                        });
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 10.we),
                      padding: EdgeInsets.all(15.we),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Colors.amber,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 6,
                            spreadRadius: 0,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.remove,
                        size: 25.we,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  AnimatedDigitWidget(
                    value: productModel.count,
                    textStyle:
                        AppTextStyle.nunitoSemiBold.copyWith(fontSize: 16.sp),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        productModel = productModel.copyWith(
                          count: productModel.count + 1,
                        );
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 10.we),
                      padding: EdgeInsets.all(15.we),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Colors.amber,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 6,
                            spreadRadius: 0,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.add,
                        size: 25.we,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              20.getH(),
              Align(
                alignment: Alignment.center,
                child: AnimatedSize(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.linear,
                  child: widget.productModel.count != productModel.count
                      ? SizedBox(
                          width: width,
                          child: MainButton(
                            onTab: () {
                              context.read<ProductBloc>().add(
                                    ProductUpdateEvent(
                                      productModel,
                                    ),
                                  );
                              Navigator.pop(context);
                            },
                            title: "O'zgarishni saqlash",
                          ),
                        )
                      : SizedBox(),
                ),
              ),
              20.getH(),
            ],
          ),
        ),
      ),
    );
  }
}
