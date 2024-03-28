import '../models/thirtyeight_item_model.dart';
import 'package:flutter/material.dart';
import 'package:aalok_s_application3/core/app_export.dart';

// ignore: must_be_immutable
class ThirtyeightItemWidget extends StatelessWidget {
  ThirtyeightItemWidget(
    this.thirtyeightItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ThirtyeightItemModel thirtyeightItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImageView(
          imagePath: thirtyeightItemModelObj?.belgeman,
          height: 48.adaptSize,
          width: 48.adaptSize,
          radius: BorderRadius.circular(
            24.h,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 10.h,
            top: 3.v,
            bottom: 4.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                thirtyeightItemModelObj.jenningsChamplin!,
                style: theme.textTheme.titleMedium,
              ),
              SizedBox(height: 3.v),
              Text(
                thirtyeightItemModelObj.jenningsChamplin1!,
                style: CustomTextStyles.bodySmallOnPrimaryContainer,
              ),
            ],
          ),
        ),
        Spacer(),
        CustomImageView(
          imagePath: ImageConstant.imgCheckmarkGray400,
          height: 24.adaptSize,
          width: 24.adaptSize,
          margin: EdgeInsets.symmetric(vertical: 12.v),
        ),
      ],
    );
  }
}
