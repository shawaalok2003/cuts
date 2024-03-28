import '../models/cards_item_model.dart';
import 'package:flutter/material.dart';
import 'package:aalok_s_application3/core/app_export.dart';

// ignore: must_be_immutable
class CardsItemWidget extends StatelessWidget {
  CardsItemWidget(
    this.cardsItemModelObj, {
    Key? key,
    this.onTapCard,
  }) : super(
          key: key,
        );

  CardsItemModel cardsItemModelObj;

  VoidCallback? onTapCard;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapCard?.call();
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 24.h,
          vertical: 23.v,
        ),
        decoration: AppDecoration.gradientPrimaryToOnErrorContainer,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cardsItemModelObj.jonathanAnderson!,
              style: theme.textTheme.labelLarge,
            ),
            SizedBox(height: 30.v),
            Text(
              cardsItemModelObj.text!,
              style: CustomTextStyles.titleMediumOnPrimary,
            ),
            SizedBox(height: 30.v),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 1.v),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cardsItemModelObj.balance!,
                        style: theme.textTheme.labelSmall,
                      ),
                      SizedBox(height: 3.v),
                      Text(
                        cardsItemModelObj.price!,
                        style: theme.textTheme.labelLarge,
                      ),
                    ],
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgUser,
                  height: 20.adaptSize,
                  width: 20.adaptSize,
                  margin: EdgeInsets.only(top: 12.v),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
