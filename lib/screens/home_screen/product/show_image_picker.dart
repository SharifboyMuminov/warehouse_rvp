import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:warehouse_rvp/utils/app_size.dart';
import 'package:warehouse_rvp/utils/app_text_style.dart';

showImageDialog(
  BuildContext context, {
  required ValueChanged<XFile?> onChaneXFile,
}) async {
  XFile? xFile;

  Future<void> pickerImageFromGallery() async {
    xFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxHeight: 1024,
      maxWidth: 1024,
    );

    onChaneXFile.call(xFile);
  }

  Future<void> pickerImageFromCamera() async {
    xFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxHeight: 1024,
      maxWidth: 1024,
    );
    onChaneXFile.call(xFile);
  }

  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
      topLeft: Radius.circular(15.r),
      topRight: Radius.circular(15.r),
    )),
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: 40.he,
          left: 15.we,
          right: 15.we,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            10.getH(),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 84.we,
                height: 5.he,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Color(0xFFEFEFEF),
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                ),
              ),
            ),
            10.getH(),
            Text(
              "Rasmni tanlash uchun",
              style: AppTextStyle.nunitoMedium.copyWith(
                fontSize: 18.sp,
                // color: AppColors.c303030.withOpacity(0.9),
              ),
            ),
            8.getH(),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFFEFEFEF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.r),
                ),
                padding:
                    EdgeInsets.symmetric(horizontal: 12.we, vertical: 6.we),
              ),
              onPressed: () {
                pickerImageFromGallery();
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.folder,
                    color: Color(0xFF474747),
                    size: 23.sp,
                  ),
                  8.getW(),
                  Text(
                    "Fayllardan tanlab",
                    style: AppTextStyle.nunitoMedium.copyWith(
                      fontSize: 14.sp,
                      color: Color(0xFF474747),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
