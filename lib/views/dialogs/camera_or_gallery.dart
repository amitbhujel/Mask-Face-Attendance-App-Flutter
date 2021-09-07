import 'package:face_attendance/constants/app_colors.dart';
import 'package:face_attendance/constants/app_defaults.dart';
import 'package:face_attendance/constants/app_sizes.dart';
import 'package:face_attendance/services/image_get_crop.dart';
import 'package:face_attendance/views/themes/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CameraGallerySelectDialog extends StatelessWidget {
  const CameraGallerySelectDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: AppDefaults.defaulBorderRadius,
      ),
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppSizes.hGap10,
            Text(
              'Select',
              style: AppText.h6.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.PRIMARY_COLOR,
              ),
            ),
            Divider(
              color: AppColors.PLACEHOLDER_COLOR,
              thickness: 0.3,
            ),
            Container(
              padding: EdgeInsets.all(
                AppSizes.DEFAULT_PADDING,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          AppPhotoService.getImageFromCamera();
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.camera_alt,
                              size: Get.width * 0.2,
                            ),
                            Text('Camera'),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          AppPhotoService.getImageFromGallery();
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.photo_library_rounded,
                              size: Get.width * 0.2,
                            ),
                            Text('Gallery')
                          ],
                        ),
                      ),
                    ],
                  ),
                  AppSizes.hGap20,
                  Text(
                    'Please select a source',
                    textAlign: TextAlign.center,
                    style: AppText.caption,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
