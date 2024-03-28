import 'package:aalok_s_application3/widgets/app_bar/custom_app_bar.dart';
import 'package:aalok_s_application3/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:aalok_s_application3/widgets/app_bar/appbar_title.dart';
import 'package:aalok_s_application3/core/utils/validation_functions.dart';
import 'package:aalok_s_application3/widgets/custom_text_form_field.dart';
import 'package:aalok_s_application3/widgets/custom_checkbox_button.dart';
import 'package:aalok_s_application3/widgets/custom_elevated_button.dart';
import 'models/add_card_one_model.dart';
import 'package:flutter/material.dart';
import 'package:aalok_s_application3/core/app_export.dart';
import 'bloc/add_card_one_bloc.dart';

// ignore_for_file: must_be_immutable
class AddCardOneScreen extends StatelessWidget {
  AddCardOneScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<AddCardOneBloc>(
        create: (context) => AddCardOneBloc(
            AddCardOneState(addCardOneModelObj: AddCardOneModel()))
          ..add(AddCardOneInitialEvent()),
        child: AddCardOneScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _formKey,
                        child: Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(
                                horizontal: 21.h, vertical: 34.v),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildInputField1(context),
                                  SizedBox(height: 19.v),
                                  _buildInputField2(context),
                                  SizedBox(height: 19.v),
                                  _buildFrame(context),
                                  SizedBox(height: 21.v),
                                  _buildSaveMyCardDetails(context),
                                  SizedBox(height: 41.v),
                                  CustomElevatedButton(
                                      text: "lbl_save".tr.toUpperCase(),
                                      margin: EdgeInsets.only(left: 6.h),
                                      onPressed: () {
                                        onTapSave(context);
                                      }),
                                  SizedBox(height: 5.v)
                                ])))))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 68.h,
        leading: AppbarLeadingIconbutton(
            imagePath: ImageConstant.imgFavoriteOnprimary,
            margin: EdgeInsets.only(left: 24.h, top: 6.v, bottom: 6.v)),
        centerTitle: true,
        title: AppbarTitle(text: "lbl_new_card".tr));
  }

  /// Section Widget
  Widget _buildInputField1(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("lbl_name".tr, style: CustomTextStyles.bodyLargeGray70001),
          SizedBox(height: 11.v),
          BlocSelector<AddCardOneBloc, AddCardOneState, TextEditingController?>(
              selector: (state) => state.nameController,
              builder: (context, nameController) {
                return CustomTextFormField(
                    controller: nameController,
                    hintText: "lbl_user_name".tr,
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
        padding: EdgeInsets.symmetric(horizontal: 3.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("lbl_card_number".tr,
              style: CustomTextStyles.bodyLargeGray70001),
          SizedBox(height: 11.v),
          BlocSelector<AddCardOneBloc, AddCardOneState, TextEditingController?>(
              selector: (state) => state.cardNumberController,
              builder: (context, cardNumberController) {
                return CustomTextFormField(
                    controller: cardNumberController,
                    hintText: "lbl_card_number2".tr,
                    textInputType: TextInputType.number,
                    validator: (value) {
                      if (!isNumeric(value)) {
                        return "err_msg_please_enter_valid_number".tr;
                      }
                      return null;
                    });
              })
        ]));
  }

  /// Section Widget
  Widget _buildInputField3(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.only(top: 1.v, right: 10.h),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("lbl_expires".tr,
                  style: CustomTextStyles.bodyLargeGray70001),
              SizedBox(height: 9.v),
              BlocSelector<AddCardOneBloc, AddCardOneState,
                      TextEditingController?>(
                  selector: (state) => state.dateController,
                  builder: (context, dateController) {
                    return CustomTextFormField(
                        width: 173.h,
                        controller: dateController,
                        hintText: "lbl_date".tr);
                  })
            ])));
  }

  /// Section Widget
  Widget _buildInputField4(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.only(left: 10.h),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("lbl_cvv".tr, style: CustomTextStyles.bodyLargeGray70001),
              SizedBox(height: 11.v),
              BlocSelector<AddCardOneBloc, AddCardOneState,
                      TextEditingController?>(
                  selector: (state) => state.cvvController,
                  builder: (context, cvvController) {
                    return CustomTextFormField(
                        width: 173.h,
                        controller: cvvController,
                        hintText: "lbl_code".tr,
                        textInputAction: TextInputAction.done);
                  })
            ])));
  }

  /// Section Widget
  Widget _buildFrame(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          _buildInputField3(context),
          _buildInputField4(context)
        ]));
  }

  /// Section Widget
  Widget _buildSaveMyCardDetails(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 6.h),
        child: BlocSelector<AddCardOneBloc, AddCardOneState, bool?>(
            selector: (state) => state.saveMyCardDetails,
            builder: (context, saveMyCardDetails) {
              return CustomCheckboxButton(
                  text: "msg_save_my_card_details".tr,
                  value: saveMyCardDetails,
                  onChange: (value) {
                    context
                        .read<AddCardOneBloc>()
                        .add(ChangeCheckBoxEvent(value: value));
                  });
            }));
  }

  /// Navigates to the paymentSuccessScreen when the action is triggered.
  onTapSave(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.paymentSuccessScreen,
    );
  }
}
