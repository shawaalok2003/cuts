import '../models/paybill_item_model.dart';
import 'package:flutter/material.dart';
import 'package:aalok_s_application3/core/app_export.dart';

// ignore: must_be_immutable
class PaybillItemWidget extends StatelessWidget {
  PaybillItemWidget(
    this.paybillItemModelObj, {
    Key? key,
    this.onTapOne,
  }) : super(
          key: key,
        );

  PaybillItemModel paybillItemModelObj;

  VoidCallback? onTapOne;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapOne?.call();
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20.h,
          vertical: 23.v,
        ),
        decoration: AppDecoration.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageView(
              imagePath: paybillItemModelObj?.electricityBill,
              height: 36.adaptSize,
              width: 36.adaptSize,
            ),
            SizedBox(height: 20.v),
            SizedBox(
              width: 97.h,
              child: Text(
                paybillItemModelObj.electricityBill1!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.titleLarge!.copyWith(
                  height: 1.50,
                ),
              ),
            ),
            SizedBox(height: 9.v),
            SizedBox(
              width: 100.h,
              child: Text(
                paybillItemModelObj.card!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyles.bodyLarge16.copyWith(
                  height: 1.50,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
