import '../models/carddetailslist_item_model.dart';
import 'package:aalok_s_application3/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:aalok_s_application3/core/app_export.dart';

// ignore: must_be_immutable
class CarddetailslistItemWidget extends StatelessWidget {
  CarddetailslistItemWidget(
    this.carddetailslistItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  CarddetailslistItemModel carddetailslistItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 12.v,
      ),
      decoration: AppDecoration.white,
      child: Row(
        children: [
          CustomIconButton(
            height: 56.adaptSize,
            width: 56.adaptSize,
            padding: EdgeInsets.all(16.h),
            decoration: IconButtonStyleHelper.fillOnPrimary,
            child: CustomImageView(
              imagePath: carddetailslistItemModelObj?.cart,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 12.h,
              top: 5.v,
              bottom: 5.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  carddetailslistItemModelObj.shopping!,
                  style: CustomTextStyles.titleMedium18,
                ),
                SizedBox(height: 3.v),
                Text(
                  carddetailslistItemModelObj.time!,
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(
              top: 15.v,
              right: 8.h,
              bottom: 18.v,
            ),
            child: Text(
              carddetailslistItemModelObj.price!,
              style: CustomTextStyles.titleMediumRed700,
            ),
          ),
        ],
      ),
    );
  }
}
