import '../models/electricbill_item_model.dart';
import 'package:flutter/material.dart';
import 'package:aalok_s_application3/core/app_export.dart';

// ignore: must_be_immutable
class ElectricbillItemWidget extends StatelessWidget {
  ElectricbillItemWidget(
    this.electricbillItemModelObj, {
    Key? key,
    this.onTapCard,
  }) : super(
          key: key,
        );

  ElectricbillItemModel electricbillItemModelObj;

  VoidCallback? onTapCard;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 305.h,
      child: Align(
        alignment: Alignment.centerRight,
        child: GestureDetector(
          onTap: () {
            onTapCard?.call();
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20.h,
              vertical: 23.v,
            ),
            decoration: AppDecoration.gradientPrimaryToOnErrorContainer,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  electricbillItemModelObj.jonathanAnderson!,
                  style: theme.textTheme.labelLarge,
                ),
                SizedBox(height: 30.v),
                Text(
                  electricbillItemModelObj.text!,
                  style: CustomTextStyles.titleMediumOnPrimary,
                ),
                SizedBox(height: 30.v),
                Padding(
                  padding: EdgeInsets.only(right: 4.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 1.v),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              electricbillItemModelObj.balance!,
                              style: theme.textTheme.labelSmall,
                            ),
                            SizedBox(height: 3.v),
                            Text(
                              electricbillItemModelObj.price!,
                              style: theme.textTheme.labelLarge,
                            ),
                          ],
                        ),
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgUser,
                        height: 20.adaptSize,
                        width: 20.adaptSize,
                        margin: EdgeInsets.only(
                          left: 193.h,
                          top: 12.v,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
