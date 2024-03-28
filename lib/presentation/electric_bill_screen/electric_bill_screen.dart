import 'package:aalok_s_application3/widgets/app_bar/custom_app_bar.dart';
import 'package:aalok_s_application3/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:aalok_s_application3/widgets/app_bar/appbar_title.dart';
import 'package:aalok_s_application3/core/utils/validation_functions.dart';
import 'package:aalok_s_application3/widgets/custom_text_form_field.dart';
import 'widgets/electricbill_item_widget.dart';
import 'models/electricbill_item_model.dart';
import 'models/electric_bill_model.dart';
import 'package:aalok_s_application3/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:aalok_s_application3/core/app_export.dart';
import 'bloc/electric_bill_bloc.dart';

// ignore_for_file: must_be_immutable
class ElectricBillScreen extends StatelessWidget {
  ElectricBillScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<ElectricBillBloc>(
        create: (context) => ElectricBillBloc(
            ElectricBillState(electricBillModelObj: ElectricBillModel()))
          ..add(ElectricBillInitialEvent()),
        child: ElectricBillScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(vertical: 34.v),
                    child: Column(children: [
                      SizedBox(height: 33.v),
                      Expanded(
                          child: SingleChildScrollView(
                              child: Padding(
                                  padding: EdgeInsets.only(bottom: 5.v),
                                  child: Column(children: [
                                    _buildInputField1(context),
                                    SizedBox(height: 19.v),
                                    _buildInputField2(context),
                                    SizedBox(height: 19.v),
                                    _buildInputField3(context),
                                    SizedBox(height: 19.v),
                                    _buildInputField4(context),
                                    SizedBox(height: 20.v),
                                    _buildFrame(context),
                                    SizedBox(height: 40.v),
                                    Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 24.h),
                                        child: _buildTax(context,
                                            taxText: "lbl_electric_fee".tr,
                                            priceText: "lbl_0".tr)),
                                    SizedBox(height: 16.v),
                                    Divider(indent: 24.h, endIndent: 24.h),
                                    SizedBox(height: 12.v),
                                    Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 24.h),
                                        child: _buildTax(context,
                                            taxText: "lbl_tax".tr,
                                            priceText: "lbl_0".tr)),
                                    SizedBox(height: 16.v),
                                    Divider(indent: 24.h, endIndent: 24.h),
                                    SizedBox(height: 12.v),
                                    Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 24.h),
                                        child: _buildTax(context,
                                            taxText: "lbl_total".tr,
                                            priceText: "lbl_0".tr)),
                                    SizedBox(height: 16.v),
                                    Divider(indent: 24.h, endIndent: 24.h),
                                    SizedBox(height: 11.v),
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                            padding:
                                                EdgeInsets.only(left: 24.h),
                                            child: Text("lbl_otp".tr,
                                                style: CustomTextStyles
                                                    .titleMediumTeal300))),
                                    SizedBox(height: 15.v),
                                    Divider(indent: 24.h, endIndent: 24.h),
                                    SizedBox(height: 39.v),
                                    _buildFrame2(context),
                                    SizedBox(height: 25.v),
                                    _buildElectricBill(context)
                                  ]))))
                    ]))),
            bottomNavigationBar: _buildSendOTP(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 68.h,
        leading: AppbarLeadingIconbutton(
            imagePath: ImageConstant.imgFavoriteOnprimary,
            margin: EdgeInsets.only(left: 24.h, top: 6.v, bottom: 6.v)),
        centerTitle: true,
        title: AppbarTitle(text: "msg_electricity_bill2".tr));
  }

  /// Section Widget
  Widget _buildInputField1(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("lbl_name".tr, style: CustomTextStyles.bodyLargeGray70001),
          SizedBox(height: 11.v),
          BlocSelector<ElectricBillBloc, ElectricBillState,
                  TextEditingController?>(
              selector: (state) => state.nameController,
              builder: (context, nameController) {
                return CustomTextFormField(
                    controller: nameController,
                    hintText: "lbl_name_here".tr,
                    validator: (value) {
                      if (!isText(value)) {
                        return "err_msg_please_enter_valid_text".tr;
                      }
                      return null;
                    });
              })
        ]));
  }

  /// Section Widget
  Widget _buildInputField2(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("lbl_address".tr, style: CustomTextStyles.bodyLargeGray70001),
          SizedBox(height: 11.v),
          BlocSelector<ElectricBillBloc, ElectricBillState,
                  TextEditingController?>(
              selector: (state) => state.addressController,
              builder: (context, addressController) {
                return CustomTextFormField(
                    controller: addressController,
                    hintText: "lbl_address_here".tr);
              })
        ]));
  }

  /// Section Widget
  Widget _buildInputField3(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("lbl_phone".tr, style: CustomTextStyles.bodyLargeGray70001),
          SizedBox(height: 11.v),
          BlocSelector<ElectricBillBloc, ElectricBillState,
                  TextEditingController?>(
              selector: (state) => state.phoneController,
              builder: (context, phoneController) {
                return CustomTextFormField(
                    controller: phoneController,
                    hintText: "lbl_phone_here".tr,
                    textInputType: TextInputType.phone,
                    validator: (value) {
                      if (!isValidPhone(value)) {
                        return "err_msg_please_enter_valid_phone_number".tr;
                      }
                      return null;
                    });
              })
        ]));
  }

  /// Section Widget
  Widget _buildInputField4(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("lbl_code".tr, style: CustomTextStyles.bodyLargeGray70001),
          SizedBox(height: 11.v),
          BlocSelector<ElectricBillBloc, ElectricBillState,
                  TextEditingController?>(
              selector: (state) => state.inputsController,
              builder: (context, inputsController) {
                return CustomTextFormField(
                    controller: inputsController,
                    hintText: "msg_enter_your_billing".tr);
              })
        ]));
  }

  /// Section Widget
  Widget _buildInputField5(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_from".tr, style: CustomTextStyles.bodyLargeGray70001),
      SizedBox(height: 11.v),
      BlocSelector<ElectricBillBloc, ElectricBillState, TextEditingController?>(
          selector: (state) => state.dateController,
          builder: (context, dateController) {
            return CustomTextFormField(
                width: 173.h,
                controller: dateController,
                hintText: "lbl_date".tr);
          })
    ]);
  }

  /// Section Widget
  Widget _buildInputField6(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 20.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("lbl_to".tr, style: CustomTextStyles.bodyLargeGray70001),
          SizedBox(height: 11.v),
          BlocSelector<ElectricBillBloc, ElectricBillState,
                  TextEditingController?>(
              selector: (state) => state.dateController1,
              builder: (context, dateController1) {
                return CustomTextFormField(
                    width: 173.h,
                    controller: dateController1,
                    hintText: "lbl_date".tr,
                    textInputAction: TextInputAction.done);
              })
        ]));
  }

  /// Section Widget
  Widget _buildFrame(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          _buildInputField5(context),
          _buildInputField6(context)
        ]));
  }

  /// Section Widget
  Widget _buildFrame2(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 27.h),
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
  Widget _buildElectricBill(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: SizedBox(
            height: 180.v,
            child: BlocSelector<ElectricBillBloc, ElectricBillState,
                    ElectricBillModel?>(
                selector: (state) => state.electricBillModelObj,
                builder: (context, electricBillModelObj) {
                  return ListView.separated(
                      padding: EdgeInsets.only(left: 27.h),
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 20.h);
                      },
                      itemCount:
                          electricBillModelObj?.electricbillItemList.length ??
                              0,
                      itemBuilder: (context, index) {
                        ElectricbillItemModel model =
                            electricBillModelObj?.electricbillItemList[index] ??
                                ElectricbillItemModel();
                        return ElectricbillItemWidget(model, onTapCard: () {
                          onTapCard(context);
                        });
                      });
                })));
  }

  /// Section Widget
  Widget _buildSendOTP(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_send_otp".tr.toUpperCase(),
        margin: EdgeInsets.only(left: 27.h, right: 21.h, bottom: 50.v),
        onPressed: () {
          onTapSendOTP(context);
        });
  }

  /// Common widget
  Widget _buildTax(
    BuildContext context, {
    required String taxText,
    required String priceText,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
          padding: EdgeInsets.only(top: 5.v, bottom: 4.v),
          child: Text(taxText,
              style: CustomTextStyles.bodyLarge16
                  .copyWith(color: appTheme.gray500))),
      Text(priceText,
          style: theme.textTheme.headlineSmall!
              .copyWith(color: theme.colorScheme.onPrimaryContainer))
    ]);
  }

  /// Navigates to the cardDetailsScreen when the action is triggered.
  onTapCard(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.cardDetailsScreen,
    );
  }

  /// Navigates to the bilPaymentSuccessScreen when the action is triggered.
  onTapSendOTP(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.bilPaymentSuccessScreen,
    );
  }
}
