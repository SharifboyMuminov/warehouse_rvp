import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warehouse_rvp/screens/home_screen/product/add_product.dart';
import 'package:warehouse_rvp/utils/app_size.dart';
import 'package:warehouse_rvp/utils/app_text_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Ombor",
          style: AppTextStyle.nunitoBold.copyWith(
            fontSize: 20.sp,
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 55.we,
        height: 55.we,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return AddProduct();
                },
              ),
            );
          },
          backgroundColor: Colors.amber,
          child: Icon(
            Icons.add,
            size: 25.we,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
