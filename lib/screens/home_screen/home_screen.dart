import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warehouse_rvp/bloc/product/product_bloc.dart';
import 'package:warehouse_rvp/bloc/product/product_event.dart';
import 'package:warehouse_rvp/bloc/product/product_state.dart';
import 'package:warehouse_rvp/data/models/form_status.dart';
import 'package:warehouse_rvp/screens/home_screen/product/add_product.dart';
import 'package:warehouse_rvp/screens/home_screen/product/product_details_screen.dart';
import 'package:warehouse_rvp/screens/home_screen/widget/costume_text_form_field.dart';
import 'package:warehouse_rvp/screens/home_screen/widget/home_item.dart';
import 'package:warehouse_rvp/utils/app_size.dart';
import 'package:warehouse_rvp/utils/app_text_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductBloc>().add(ProductFetchEvent());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          scrolledUnderElevation: 0,
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: CostumeTextFormField(
                onChanged: (v) {
                  context.read<ProductBloc>().add(ProductSearchEvent(v));
                },
                hintText: "Qidirish...",
                textInputAction: TextInputAction.done,
              ),
            ),
            BlocConsumer<ProductBloc, ProductState>(
              builder: (BuildContext context, state) {
                if (state.formStatus == FormStatus.loading) {
                  return const Center(
                    child: CupertinoActivityIndicator(
                      color: Colors.grey,
                    ),
                  );
                }

                if (state.formStatus == FormStatus.error) {
                  return Center(
                    child: Text(
                      state.errorMessage,
                      style: AppTextStyle.nunitoMedium.copyWith(
                        fontSize: 18.sp,
                        color: Colors.black,
                      ),
                    ),
                  );
                }

                if (state.products.isEmpty) {
                  return Center(
                    child: Text(
                      "Mahsulot bo'sh.",
                      style: AppTextStyle.nunitoMedium.copyWith(
                        fontSize: 18.sp,
                        color: Colors.black,
                      ),
                    ),
                  );
                }

                return Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(
                      bottom: 90.he,
                    ),
                    itemCount: state.products.length,
                    itemBuilder: (BuildContext context, int index) {
                      return HomeItem(
                        onTab: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ProductDetailsScreen(
                                  productModel: state.products[index],
                                );
                              },
                            ),
                          );
                        },
                        productModel: state.products[index],
                      );
                    },
                  ),
                );
              },
              listener: (BuildContext context, state) {},
            ),
            SizedBox(),
          ],
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
      ),
    );
  }
}
