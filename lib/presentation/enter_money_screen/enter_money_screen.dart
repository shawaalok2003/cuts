import 'package:aalok_s_application3/widgets/app_bar/custom_app_bar.dart';
import 'package:aalok_s_application3/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:aalok_s_application3/widgets/app_bar/appbar_title.dart';
import 'package:aalok_s_application3/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:aalok_s_application3/widgets/custom_text_form_field.dart';
import 'package:aalok_s_application3/widgets/custom_elevated_button.dart';
import 'models/enter_money_model.dart';
import 'package:flutter/material.dart';
import 'package:aalok_s_application3/core/app_export.dart';
import 'bloc/enter_money_bloc.dart';

class EnterMoneyScreen extends StatelessWidget {
  const EnterMoneyScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<EnterMoneyBloc>(
        create: (context) => EnterMoneyBloc(
            EnterMoneyState(enterMoneyModelObj: EnterMoneyModel()))
          ..add(EnterMoneyInitialEvent()),
        child: EnterMoneyScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 18.v),
                child: Column(children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgEllipse8130x130,
                      height: 130.adaptSize,
                      width: 130.adaptSize,
                      radius: BorderRadius.circular(65.h)),
                  SizedBox(height: 6.v),
                  Text("lbl_kate_morgan".tr,
                      style: theme.textTheme.headlineSmall),
                  SizedBox(height: 2.v),
                  Text("lbl_159_107_1365".tr,
                      style: CustomTextStyles.bodySmallOnPrimaryContainer),
                  SizedBox(height: 23.v),
                  Text("lbl_60_00".tr, style: theme.textTheme.displayLarge),
                  SizedBox(height: 32.v),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.h),
                      child: BlocSelector<EnterMoneyBloc, EnterMoneyState,
                              TextEditingController?>(
                          selector: (state) => state.messageController,
                          builder: (context, messageController) {
                            return CustomTextFormField(
                                controller: messageController,
                                hintText: "msg_type_your_message".tr,
                                textInputAction: TextInputAction.done);
                          })),
                  SizedBox(height: 39.v),
                  _buildFrame(context),
                  SizedBox(height: 25.v),
                  _buildJonathanAnderson(context),
                  SizedBox(height: 5.v)
                ])),
            bottomNavigationBar: _buildContinue(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 68.h,
        leading: AppbarLeadingIconbutton(
            imagePath: ImageConstant.imgFavoriteOnprimary,
            margin: EdgeInsets.only(left: 24.h, top: 6.v, bottom: 6.v)),
        centerTitle: true,
        title: AppbarTitle(text: "lbl_money_transfer".tr),
        actions: [
          AppbarTrailingIconbutton(
              imagePath: ImageConstant.imgPlus,
              margin: EdgeInsets.symmetric(horizontal: 24.h, vertical: 6.v),
              onTap: () {
                onTapPlus(context);
              })
        ]);
  }

  /// Section Widget
  Widget _buildFrame(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 24.h, right: 30.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("lbl_select_card".tr,
              style: CustomTextStyles.headlineSmallExtraBold),
          Padding(
              padding: EdgeInsets.only(top: 5.v, bottom: 4.v),
              child: Text("lbl_add_card".tr,
                  style: CustomTextStyles.titleMediumPrimary))
        ]));
  }

  /// Section Widget
  Widget _buildJonathanAnderson(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 24.h),
            child: IntrinsicWidth(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Expanded(
                  child: GestureDetector(
                      onTap: () {
                        onTapCard(context);
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.h, vertical: 23.v),
                          decoration:
                              AppDecoration.gradientPrimaryToOnErrorContainer,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("msg_jonathan_anderson".tr,
                                    style: theme.textTheme.labelLarge),
                                SizedBox(height: 30.v),
                                Text("msg_1222_3443_9881_1222".tr,
                                    style:
                                        CustomTextStyles.titleMediumOnPrimary),
                                SizedBox(height: 30.v),
                                Padding(
                                    padding: EdgeInsets.only(right: 4.h),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 1.v),
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text("lbl_balance".tr,
                                                        style: theme.textTheme
                                                            .labelSmall),
                                                    SizedBox(height: 3.v),
                                                    Text("lbl_31_250".tr,
                                                        style: theme.textTheme
                                                            .labelLarge)
                                                  ])),
                                          CustomImageView(
                                              imagePath: ImageConstant.imgUser,
                                              height: 20.adaptSize,
                                              width: 20.adaptSize,
                                              margin:
                                                  EdgeInsets.only(top: 12.v))
                                        ]))
                              ])))),
              Expanded(
                  child: GestureDetector(
                      onTap: () {
                        onTapCard1(context);
                      },
                      child: Container(
                          margin: EdgeInsets.only(left: 20.h),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.h, vertical: 23.v),
                          decoration: AppDecoration.gradientTealToTeal,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(bottom: 2.v),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("msg_jonathan_anderson".tr,
                                              style:
                                                  theme.textTheme.labelLarge),
                                          SizedBox(height: 30.v),
                                          Text("msg_1222_3443_9881_1222".tr,
                                              style: CustomTextStyles
                                                  .titleMediumOnPrimary),
                                          SizedBox(height: 30.v),
                                          Text("lbl_balance".tr,
                                              style:
                                                  theme.textTheme.labelSmall),
                                          SizedBox(height: 3.v),
                                          Text("lbl_31_250".tr,
                                              style: theme.textTheme.labelLarge)
                                        ])),
                                CustomImageView(
                                    imagePath: ImageConstant.imgUser,
                                    height: 20.adaptSize,
                                    width: 20.adaptSize,
                                    margin:
                                        EdgeInsets.only(top: 112.v, right: 4.h))
                              ]))))
            ]))));
  }

  /// Section Widget
  Widget _buildContinue(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_continue".tr.toUpperCase(),
        margin: EdgeInsets.only(left: 27.h, right: 21.h, bottom: 29.v),
        onPressed: () {
          onTapContinue(context);
        });
  }

  /// Navigates to the addPersonScreen when the action is triggered.
  onTapPlus(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.addPersonScreen,
    );
  }

  /// Navigates to the cardDetailsScreen when the action is triggered.
  onTapCard(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.cardDetailsScreen,
    );
  }

  /// Navigates to the cardDetailsScreen when the action is triggered.
  onTapCard1(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.cardDetailsScreen,
    );
  }

  /// Navigates to the sendMoneyEnterPasswordScreen when the action is triggered.
  onTapContinue(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.sendMoneyEnterPasswordScreen,
    );
  }
}
