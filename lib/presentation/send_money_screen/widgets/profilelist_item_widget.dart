import '../models/profilelist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:aalok_s_application3/core/app_export.dart';

// ignore: must_be_immutable
class ProfilelistItemWidget extends StatelessWidget {
  ProfilelistItemWidget(
    this.profilelistItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ProfilelistItemModel profilelistItemModelObj;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60.h,
      child: CustomImageView(
        imagePath: profilelistItemModelObj?.ellipse,
        height: 60.adaptSize,
        width: 60.adaptSize,
        radius: BorderRadius.circular(
          30.h,
        ),
      ),
    );
  }
}
