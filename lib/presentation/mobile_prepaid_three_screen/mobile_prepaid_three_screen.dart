import 'package:aalok_s_application3/widgets/app_bar/custom_app_bar.dart';
import 'package:aalok_s_application3/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:aalok_s_application3/widgets/app_bar/appbar_title.dart';
import 'package:aalok_s_application3/widgets/custom_pin_code_text_field.dart';
import 'package:aalok_s_application3/widgets/custom_elevated_button.dart';
import 'models/mobile_prepaid_three_model.dart';
import 'package:flutter/material.dart';
import 'package:aalok_s_application3/core/app_export.dart';
import 'bloc/mobile_prepaid_three_bloc.dart';

class MobilePrepaidThreeScreen extends StatelessWidget {
  const MobilePrepaidThreeScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<MobilePrepaidThreeBloc>(
        create: (context) => MobilePrepaidThreeBloc(MobilePrepaidThreeState(
            mobilePrepaidThreeModelObj: MobilePrepaidThreeModel()))
          ..add(MobilePrepaidThreeInitialEvent()),
        child: MobilePrepaidThreeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(left: 24.h, top: 64.v, right: 24.h),
                child: Column(children: [
                  SizedBox(
                      width: 221.h,
                      child: Text("msg_enter_your_account".tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: CustomTextStyles.headlineSmallExtraBold
                              .copyWith(height: 1.50))),
                  SizedBox(height: 3.v),
                  Text("msg_enter_your_send".tr,
                      style: theme.textTheme.bodyMedium),
                  SizedBox(height: 42.v),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 23.h),
                      child: BlocSelector<MobilePrepaidThreeBloc,
                              MobilePrepaidThreeState, TextEditingController?>(
                          selector: (state) => state.otpController,
                          builder: (context, otpController) {
                            return CustomPinCodeTextField(
                                context: context,
                                controller: otpController,
                                onChanged: (value) {
                                  otpController?.text = value;
                                });
                          })),
                  SizedBox(height: 40.v),
                  CustomElevatedButton(
                      text: "lbl_make_payment".tr.toUpperCase()),
                  SizedBox(height: 5.v)
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 68.h,
        leading: AppbarLeadingIconbutton(
            imagePath: ImageConstant.imgFavoriteOnprimary,
            margin: EdgeInsets.only(left: 24.h, top: 6.v, bottom: 6.v)),
        centerTitle: true,
        title: AppbarTitle(text: "lbl_mobile_prepaid2".tr));
  }
}
