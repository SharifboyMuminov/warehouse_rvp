import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warehouse_rvp/screens/home_screen/widget/costume_text_form_field.dart';
import 'package:warehouse_rvp/screens/home_screen/widget/main_button.dart';
import 'package:warehouse_rvp/utils/app_size.dart';
import 'package:warehouse_rvp/utils/app_text_style.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Text(
          "Mahsulot qo'shish",
          style: AppTextStyle.nunitoBold.copyWith(
            fontSize: 20.sp,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.we,
                  vertical: 10.he,
                ),
                child: Column(
                  children: [
                    CostumeTextFormField(
                      hintText: "Mahsulot nomini kiriting...",
                      label: "Mahsulot",
                    ),
                    10.getH(),
                    CostumeTextFormField(
                      hintText: "Mahsulot narhini kiriting...",
                      label: "Narhi",
                    ),
                    10.getH(),
                    CostumeTextFormField(
                      hintText: "Mahsulot sonini kiriting...",
                      label: "Soni",
                    ),
                    10.getH(),
                    CostumeTextFormField(
                      hintText: "Mahsulot qr kodinni kiriting...",
                      label: "Qr",
                      textInputAction: TextInputAction.done,
                    ),
                  ],
                ),
              ),
            ),
            10.getH(),
            SizedBox(
              width: width - (30.we),
              child: MainButton(
                title: "Saqlash",
                onTab: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
