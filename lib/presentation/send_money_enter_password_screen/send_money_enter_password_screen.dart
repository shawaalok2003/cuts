import 'package:aalok_s_application3/widgets/app_bar/custom_app_bar.dart';
import 'package:aalok_s_application3/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:aalok_s_application3/widgets/app_bar/appbar_title.dart';
import 'package:aalok_s_application3/widgets/custom_pin_code_text_field.dart';
import 'package:aalok_s_application3/widgets/custom_elevated_button.dart';
import 'models/send_money_enter_password_model.dart';
import 'package:flutter/material.dart';
import 'package:aalok_s_application3/core/app_export.dart';
import 'bloc/send_money_enter_password_bloc.dart';

class SendMoneyEnterPasswordScreen extends StatelessWidget {
  const SendMoneyEnterPasswordScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<SendMoneyEnterPasswordBloc>(
        create: (context) => SendMoneyEnterPasswordBloc(
            SendMoneyEnterPasswordState(
                sendMoneyEnterPasswordModelObj: SendMoneyEnterPasswordModel()))
          ..add(SendMoneyEnterPasswordInitialEvent()),
        child: SendMoneyEnterPasswordScreen());
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
                      width: 217.h,
                      child: Text("msg_enter_your_account".tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.headlineSmall!
                              .copyWith(height: 1.50))),
                  SizedBox(height: 3.v),
                  Text("msg_enter_your_account2".tr,
                      style: theme.textTheme.bodyMedium),
                  SizedBox(height: 39.v),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 23.h),
                      child: BlocSelector<
                              SendMoneyEnterPasswordBloc,
                              SendMoneyEnterPasswordState,
                              TextEditingController?>(
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
        title: AppbarTitle(text: "lbl_money_transfer".tr));
  }
}
