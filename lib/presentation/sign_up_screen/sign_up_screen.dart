import 'package:aalok_s_application3/core/utils/validation_functions.dart';
import 'package:aalok_s_application3/widgets/custom_text_form_field.dart';
import 'package:aalok_s_application3/widgets/custom_elevated_button.dart';
import 'package:aalok_s_application3/widgets/custom_outlined_button.dart';
import 'models/sign_up_model.dart';
import 'package:flutter/material.dart';
import 'package:aalok_s_application3/core/app_export.dart';
import 'bloc/sign_up_bloc.dart';
import 'package:aalok_s_application3/domain/googleauth/google_auth_helper.dart';

// ignore_for_file: must_be_immutable
class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<SignUpBloc>(
        create: (context) =>
            SignUpBloc(SignUpState(signUpModelObj: SignUpModel()))
              ..add(SignUpInitialEvent()),
        child: SignUpScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
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
                                horizontal: 21.h, vertical: 40.v),
                            child: Column(children: [
                              CustomImageView(
                                  imagePath: ImageConstant.imgThumbsUp,
                                  width: 78.h),
                              SizedBox(height: 69.v),
                              _buildInputFieldPhoneOrEmail(context),
                              SizedBox(height: 23.v),
                              _buildInputFieldSetPassword(context),
                              SizedBox(height: 23.v),
                              _buildInputFieldConfirmPassword(context),
                              SizedBox(height: 40.v),
                              CustomElevatedButton(
                                  text: "lbl_sign_up2".tr.toUpperCase(),
                                  margin: EdgeInsets.only(left: 6.h),
                                  onPressed: () {
                                    onTapSIGNUp(context);
                                  }),
                              SizedBox(height: 40.v),
                              CustomOutlinedButton(
                                  text: "msg_sign_in_with_google"
                                      .tr
                                      .toUpperCase(),
                                  margin: EdgeInsets.only(left: 6.h),
                                  leftIcon: Container(
                                      margin: EdgeInsets.only(right: 10.h),
                                      child: CustomImageView(
                                          imagePath: ImageConstant.imgGoogle,
                                          height: 24.adaptSize,
                                          width: 24.adaptSize)),
                                  onPressed: () {
                                    onTapSignInWithGoogle(context);
                                  }),
                              SizedBox(height: 77.v),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 2.v),
                                        child: Text("lbl_have_account".tr,
                                            style: CustomTextStyles
                                                .titleLargeGray500Regular)),
                                    GestureDetector(
                                        onTap: () {
                                          onTapTxtSignIn(context);
                                        },
                                        child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 8.h, top: 2.v),
                                            child: Text("lbl_sign_in2".tr,
                                                style: CustomTextStyles
                                                    .titleLargePrimary)))
                                  ]),
                              SizedBox(height: 5.v)
                            ])))))));
  }

  /// Section Widget
  Widget _buildInputFieldPhoneOrEmail(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 6.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("lbl_phone_or_email".tr,
              style: CustomTextStyles.bodyLargeGray70001),
          SizedBox(height: 11.v),
          BlocSelector<SignUpBloc, SignUpState, TextEditingController?>(
              selector: (state) => state.phoneController,
              builder: (context, phoneController) {
                return CustomTextFormField(
                    controller: phoneController,
                    hintText: "lbl_email".tr,
                    textInputType: TextInputType.emailAddress,
                    prefix: Container(
                        margin: EdgeInsets.fromLTRB(24.h, 20.v, 12.h, 20.v),
                        child: CustomImageView(
                            imagePath: ImageConstant.imgCheckmark,
                            height: 24.adaptSize,
                            width: 24.adaptSize)),
                    prefixConstraints: BoxConstraints(maxHeight: 64.v),
                    validator: (value) {
                      if (value == null ||
                          (!isValidEmail(value, isRequired: true))) {
                        return "err_msg_please_enter_valid_email".tr;
                      }
                      return null;
                    },
                    contentPadding:
                        EdgeInsets.only(top: 20.v, right: 30.h, bottom: 20.v));
              })
        ]));
  }

  /// Section Widget
  Widget _buildInputFieldSetPassword(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 6.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("lbl_set_password".tr,
              style: CustomTextStyles.bodyLargeGray70001),
          SizedBox(height: 11.v),
          BlocSelector<SignUpBloc, SignUpState, TextEditingController?>(
              selector: (state) => state.passwordController,
              builder: (context, passwordController) {
                return CustomTextFormField(
                    controller: passwordController,
                    hintText: "lbl_set_password".tr,
                    textInputType: TextInputType.visiblePassword,
                    prefix: Container(
                        margin: EdgeInsets.fromLTRB(24.h, 20.v, 12.h, 20.v),
                        child: CustomImageView(
                            imagePath: ImageConstant.imgLocation,
                            height: 24.adaptSize,
                            width: 24.adaptSize)),
                    prefixConstraints: BoxConstraints(maxHeight: 64.v),
                    validator: (value) {
                      if (value == null ||
                          (!isValidPassword(value, isRequired: true))) {
                        return "err_msg_please_enter_valid_password".tr;
                      }
                      return null;
                    },
                    obscureText: true,
                    contentPadding:
                        EdgeInsets.only(top: 20.v, right: 30.h, bottom: 20.v));
              })
        ]));
  }

  /// Section Widget
  Widget _buildInputFieldConfirmPassword(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 6.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("msg_confirm_password".tr,
              style: CustomTextStyles.bodyLargeGray70001),
          SizedBox(height: 11.v),
          BlocSelector<SignUpBloc, SignUpState, TextEditingController?>(
              selector: (state) => state.confirmpasswordController,
              builder: (context, confirmpasswordController) {
                return CustomTextFormField(
                    controller: confirmpasswordController,
                    hintText: "msg_confirm_password".tr,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.visiblePassword,
                    prefix: Container(
                        margin: EdgeInsets.fromLTRB(24.h, 20.v, 12.h, 20.v),
                        child: CustomImageView(
                            imagePath: ImageConstant.imgLocation,
                            height: 24.adaptSize,
                            width: 24.adaptSize)),
                    prefixConstraints: BoxConstraints(maxHeight: 64.v),
                    validator: (value) {
                      if (value == null ||
                          (!isValidPassword(value, isRequired: true))) {
                        return "err_msg_please_enter_valid_password".tr;
                      }
                      return null;
                    },
                    obscureText: true,
                    contentPadding:
                        EdgeInsets.only(top: 20.v, right: 30.h, bottom: 20.v));
              })
        ]));
  }

  /// Navigates to the logInScreen when the action is triggered.
  onTapSIGNUp(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.logInScreen,
    );
  }

  onTapSignInWithGoogle(BuildContext context) async {
    await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
      if (googleUser != null) {
        //TODO Actions to be performed after signin
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('user data is empty')));
      }
    }).catchError((onError) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(onError.toString())));
    });
  }

  /// Navigates to the logInScreen when the action is triggered.
  onTapTxtSignIn(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.logInScreen,
    );
  }
}
