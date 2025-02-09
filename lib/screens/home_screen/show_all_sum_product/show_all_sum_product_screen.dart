import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:warehouse_rvp/bloc/product/product_bloc.dart';
import 'package:warehouse_rvp/data/models/product_model.dart';
import 'package:warehouse_rvp/screens/home_screen/show_all_sum_product/widget/show_sum_item.dart';
import 'package:warehouse_rvp/utils/app_size.dart';
import 'package:warehouse_rvp/utils/app_text_style.dart';

class ShowAllSumProductScreen extends StatefulWidget {
  const ShowAllSumProductScreen({super.key});

  @override
  State<ShowAllSumProductScreen> createState() =>
      _ShowAllSumProductScreenState();
}

class _ShowAllSumProductScreenState extends State<ShowAllSumProductScreen> {
  List<ProductModel> products = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      products = context.read<ProductBloc>().state.products;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Ombor dagi jami summa",
          style: AppTextStyle.nunitoBold.copyWith(
            fontSize: 20.sp,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(10.we),
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  return ShowSumItem(
                    productModel: products[index],
                  );
                },
              ),
            ),
            Text(
              NumberFormat("#,##0.00", "uz_UZ").format(getAllSum()),
              style: AppTextStyle.nunitoBold.copyWith(
                fontSize: 16.sp,
              ),
            ),
            5.getH(),
            Text(
              "Umumiy ombordagi mahsulotlar narhi.",
              style: AppTextStyle.nunitoBold.copyWith(
                fontSize: 16.sp,
              ),
            ),
            10.getH(),
          ],
        ),
      ),
    );
  }

  num getAllSum() {
    num allSumProducts = 0;

    for (var item in products) {
      allSumProducts += item.price * item.count;
    }

    return allSumProducts;
  }
}
