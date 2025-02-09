import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:warehouse_rvp/bloc/product/product_bloc.dart';
import 'package:warehouse_rvp/bloc/product/product_event.dart';
import 'package:warehouse_rvp/data/models/product_model.dart';
import 'package:warehouse_rvp/screens/home_screen/product/show_image_picker.dart';
import 'package:warehouse_rvp/screens/home_screen/widget/costume_text_form_field.dart';
import 'package:warehouse_rvp/screens/home_screen/widget/main_button.dart';
import 'package:warehouse_rvp/utils/app_size.dart';
import 'package:warehouse_rvp/utils/app_text_style.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  XFile? xFile;

  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerPrice = TextEditingController();
  final TextEditingController _controllerCont = TextEditingController();
  final TextEditingController _controllerQr = TextEditingController();
  final TextEditingController _controllerDescription = TextEditingController();

  @override
  void initState() {
    _controllerName.text = widget.productModel.productName;
    _controllerPrice.text = widget.productModel.price.toString();
    _controllerCont.text = widget.productModel.count.toString();
    _controllerQr.text = widget.productModel.qrCode;
    _controllerDescription.text = widget.productModel.description;

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
          "Mahsulotni yangilash",
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
                      onChanged: (v) => setState(() {}),
                      controller: _controllerName,
                      hintText: "Mahsulot nomini kiriting...",
                      label: "Mahsulot",
                    ),
                    10.getH(),
                    CostumeTextFormField(
                      onChanged: (v) => setState(() {}),
                      controller: _controllerPrice,
                      hintText: "Mahsulot narhini kiriting...",
                      label: "Narhi",
                      textInputType: TextInputType.number,
                    ),
                    10.getH(),
                    CostumeTextFormField(
                      onChanged: (v) => setState(() {}),
                      controller: _controllerCont,
                      hintText: "Mahsulot sonini kiriting...",
                      label: "Soni",
                      textInputType: TextInputType.number,
                    ),
                    10.getH(),
                    CostumeTextFormField(
                      onChanged: (v) => setState(() {}),
                      controller: _controllerQr,
                      hintText: "Mahsulot qr kodinni kiriting...",
                      label: "Qr",
                    ),
                    10.getH(),
                    CostumeTextFormField(
                      onChanged: (v) => setState(() {}),
                      controller: _controllerDescription,
                      hintText: "Qoshimcha malumotni kiriting...",
                      label: "Qoshimcha",
                      textInputAction: TextInputAction.done,
                      maxLines: null,
                    ),
                    if (xFile != null) ...[
                      10.getH(),
                      SizedBox(
                        width: double.infinity,
                        height: 200.he,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            image: DecorationImage(
                              image: FileImage(
                                File(xFile!.path),
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                    if (xFile == null &&
                        widget.productModel.imagePath.isNotEmpty) ...[
                      10.getH(),
                      SizedBox(
                        width: double.infinity,
                        height: 200.he,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            image: DecorationImage(
                              image: FileImage(
                                File(widget.productModel.imagePath),
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                    10.getH(),
                    Row(
                      children: [
                        if (xFile != null)
                          MainButton(
                            onTab: () {
                              setState(() {
                                xFile = null;
                              });
                            },
                            titleSize: 14,
                            title: "Rasimni o'chirish",
                          ),
                        const Spacer(),
                        MainButton(
                          onTab: () {
                            showImageDialog(
                              context,
                              onChaneXFile: (v) {
                                setState(() {
                                  xFile = v;
                                });
                              },
                            );
                          },
                          titleSize: 14,
                          title: xFile != null
                              ? "Rasimni yangilash"
                              : "Rasim qo'shish",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            10.getH(),
            SizedBox(
              width: width - (30.we),
              child: MainButton(
                isActive: _checkInput(),
                title: "Saqlash",
                onTab: () {
                  String imagePath = widget.productModel.imagePath;

                  if (xFile != null) {
                    imagePath = xFile!.path;
                  }

                  context.read<ProductBloc>().add(
                        ProductUpdateEvent(
                          widget.productModel.copyWith(
                            description: _controllerDescription.text,
                            price: num.tryParse(_controllerPrice.text) ?? 0,
                            count: int.tryParse(_controllerCont.text) ?? 0,
                            imagePath: imagePath,
                            productName: _controllerName.text,
                            qrCode: _controllerQr.text,
                          ),
                        ),
                      );
                  Navigator.pop(context);
                },
              ),
            ),
            10.getH(),
          ],
        ),
      ),
    );
  }

  bool _checkInput() {
    bool checkChange = _controllerQr.text != widget.productModel.qrCode ||
        _controllerName.text != widget.productModel.productName ||
        _controllerCont.text != widget.productModel.count.toString() ||
        _controllerDescription.text != widget.productModel.description ||
        xFile != null ||
        _controllerPrice.text != widget.productModel.price.toString();

    return _controllerQr.text.isNotEmpty &&
        _controllerName.text.isNotEmpty &&
        _controllerCont.text.isNotEmpty &&
        _controllerPrice.text.isNotEmpty &&
        checkChange;
  }

  @override
  void dispose() {
    _controllerQr.dispose();
    _controllerCont.dispose();
    _controllerPrice.dispose();
    _controllerName.dispose();
    _controllerDescription.dispose();
    super.dispose();
  }
}
