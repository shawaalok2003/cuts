import 'package:aalok_s_application3/widgets/app_bar/custom_app_bar.dart';
import 'package:aalok_s_application3/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:aalok_s_application3/widgets/app_bar/appbar_title.dart';
import 'package:aalok_s_application3/widgets/custom_text_form_field.dart';
import 'package:aalok_s_application3/widgets/custom_elevated_button.dart';
import 'models/bank_to_bank_two_model.dart';
import 'package:flutter/material.dart';
import 'package:aalok_s_application3/core/app_export.dart';
import 'bloc/bank_to_bank_two_bloc.dart';

class BankToBankTwoScreen extends StatelessWidget {
  const BankToBankTwoScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<BankToBankTwoBloc>(
        create: (context) => BankToBankTwoBloc(
            BankToBankTwoState(bankToBankTwoModelObj: BankToBankTwoModel()))
          ..add(BankToBankTwoInitialEvent()),
        child: BankToBankTwoScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(left: 24.h, top: 63.v, right: 24.h),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 62.h),
                          child: Text("msg_enter_the_ammount".tr,
                              style: CustomTextStyles.headlineSmallExtraBold)),
                      SizedBox(height: 10.v),
                      Padding(
                          padding: EdgeInsets.only(left: 72.h),
                          child: Text("msg_enter_ammount_you".tr,
                              style: theme.textTheme.bodyMedium)),
                      SizedBox(height: 41.v),
                      BlocSelector<BankToBankTwoBloc, BankToBankTwoState,
                              TextEditingController?>(
                          selector: (state) => state.priceController,
                          builder: (context, priceController) {
                            return CustomTextFormField(
                                controller: priceController,
                                hintText: "lbl_500".tr,
                                hintStyle: CustomTextStyles.titleMedium18,
                                textInputAction: TextInputAction.done);
                          }),
                      SizedBox(height: 40.v),
                      CustomElevatedButton(
                          text: "lbl_continue".tr.toUpperCase(),
                          onPressed: () {
                            onTapContinue(context);
                          }),
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
        title: AppbarTitle(text: "lbl_bank_to_bank2".tr));
  }

  /// Navigates to the bankToBankThreeScreen when the action is triggered.
  onTapContinue(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.bankToBankThreeScreen,
    );
  }
}
