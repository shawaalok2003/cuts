import 'package:aalok_s_application3/widgets/custom_icon_button.dart';
import 'widgets/carddetailslist_item_widget.dart';
import 'models/carddetailslist_item_model.dart';
import 'models/card_details_model.dart';
import 'package:flutter/material.dart';
import 'package:aalok_s_application3/core/app_export.dart';
import 'bloc/card_details_bloc.dart';

class CardDetailsScreen extends StatelessWidget {
  const CardDetailsScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<CardDetailsBloc>(
      create: (context) => CardDetailsBloc(CardDetailsState(
        cardDetailsModelObj: CardDetailsModel(),
      ))
        ..add(CardDetailsInitialEvent()),
      child: CardDetailsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 40.v),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 103.v),
                    padding: EdgeInsets.symmetric(horizontal: 12.h),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 12.h),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomIconButton(
                                  height: 44.adaptSize,
                                  width: 44.adaptSize,
                                  padding: EdgeInsets.all(10.h),
                                  child: CustomImageView(
                                    imagePath: ImageConstant.imgGrid,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 88.h,
                                    top: 6.v,
                                    bottom: 11.v,
                                  ),
                                  child: Text(
                                    "lbl_your_cards".tr,
                                    style: theme.textTheme.titleLarge,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 40.v),
                        _buildHeaderRow(context),
                        SizedBox(height: 42.v),
                        _buildDateRow(context),
                        SizedBox(height: 22.v),
                        _buildCardDetailsList(context),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildHeaderRow(BuildContext context) {
    return SizedBox(
      height: 180.v,
      width: 390.h,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 12.h),
              padding: EdgeInsets.symmetric(
                horizontal: 24.h,
                vertical: 23.v,
              ),
              decoration: AppDecoration.gradientPrimaryToOnErrorContainer,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "msg_jonathan_anderson".tr,
                    style: theme.textTheme.labelLarge,
                  ),
                  SizedBox(height: 30.v),
                  Text(
                    "msg_1222_3443_9881_1222".tr,
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
                              "lbl_balance".tr,
                              style: theme.textTheme.labelSmall,
                            ),
                            SizedBox(height: 3.v),
                            Text(
                              "lbl_31_250".tr,
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
          ),
          CustomIconButton(
            height: 30.adaptSize,
            width: 30.adaptSize,
            padding: EdgeInsets.all(10.h),
            decoration: IconButtonStyleHelper.outlineBlackF,
            alignment: Alignment.centerRight,
            child: CustomImageView(
              imagePath: ImageConstant.imgOverflowMenu,
            ),
          ),
          CustomIconButton(
            height: 30.adaptSize,
            width: 30.adaptSize,
            padding: EdgeInsets.all(10.h),
            decoration: IconButtonStyleHelper.outlineBlackF,
            alignment: Alignment.centerLeft,
            child: CustomImageView(
              imagePath: ImageConstant.imgRefresh,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildDateRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "lbl_today".tr,
            style: CustomTextStyles.headlineSmallExtraBold,
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(
              top: 6.v,
              bottom: 8.v,
            ),
            child: Text(
              "lbl_25_jan".tr,
              style: CustomTextStyles.labelLargeGray500,
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgFavoriteGray500,
            height: 12.adaptSize,
            width: 12.adaptSize,
            margin: EdgeInsets.only(
              left: 3.h,
              top: 9.v,
              bottom: 9.v,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildCardDetailsList(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.h),
      child: BlocSelector<CardDetailsBloc, CardDetailsState, CardDetailsModel?>(
        selector: (state) => state.cardDetailsModelObj,
        builder: (context, cardDetailsModelObj) {
          return ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (
              context,
              index,
            ) {
              return SizedBox(
                height: 20.v,
              );
            },
            itemCount: cardDetailsModelObj?.carddetailslistItemList.length ?? 0,
            itemBuilder: (context, index) {
              CarddetailslistItemModel model =
                  cardDetailsModelObj?.carddetailslistItemList[index] ??
                      CarddetailslistItemModel();
              return CarddetailslistItemWidget(
                model,
              );
            },
          );
        },
      ),
    );
  }
}
