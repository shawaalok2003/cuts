import 'package:aalok_s_application3/widgets/app_bar/custom_app_bar.dart';
import 'package:aalok_s_application3/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:aalok_s_application3/widgets/app_bar/appbar_title.dart';
import 'package:aalok_s_application3/widgets/custom_icon_button.dart';
import 'package:aalok_s_application3/widgets/custom_text_form_field.dart';
import 'package:aalok_s_application3/core/utils/validation_functions.dart';
import 'package:aalok_s_application3/widgets/custom_elevated_button.dart';
import 'models/edit_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:aalok_s_application3/core/app_export.dart';
import 'bloc/edit_profile_bloc.dart';

// ignore_for_file: must_be_immutable
class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<EditProfileBloc>(
        create: (context) => EditProfileBloc(
            EditProfileState(editProfileModelObj: EditProfileModel()))
          ..add(EditProfileInitialEvent()),
        child: EditProfileScreen());
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
                                horizontal: 24.h, vertical: 18.v),
                            child: Column(children: [
                              GestureDetector(
                                  onTap: () {
                                    onTapProfile(context);
                                  },
                                  child: SizedBox(
                                      height: 139.adaptSize,
                                      width: 139.adaptSize,
                                      child: Stack(
                                          alignment: Alignment.bottomRight,
                                          children: [
                                            CustomImageView(
                                                imagePath:
                                                    ImageConstant.imgEllipse107,
                                                height: 139.adaptSize,
                                                width: 139.adaptSize,
                                                radius:
                                                    BorderRadius.circular(69.h),
                                                alignment: Alignment.center),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(right: 7.h),
                                                child: CustomIconButton(
                                                    height: 30.adaptSize,
                                                    width: 30.adaptSize,
                                                    padding:
                                                        EdgeInsets.all(9.h),
                                                    decoration:
                                                        IconButtonStyleHelper
                                                            .outlineGray,
                                                    alignment:
                                                        Alignment.bottomRight,
                                                    child: CustomImageView(
                                                        imagePath: ImageConstant
                                                            .imgThumbsUpOnprimary)))
                                          ]))),
                              SizedBox(height: 8.v),
                              Text("lbl_suzane_jobs".tr,
                                  style: theme.textTheme.displaySmall),
                              SizedBox(height: 9.v),
                              Text("lbl_user_gmail_com".tr,
                                  style: CustomTextStyles.titleSmallGray500),
                              SizedBox(height: 41.v),
                              _buildInputField1(context),
                              SizedBox(height: 23.v),
                              _buildInputField2(context),
                              SizedBox(height: 23.v),
                              _buildInputField3(context),
                              SizedBox(height: 40.v),
                              CustomElevatedButton(
                                  text: "lbl_save".tr.toUpperCase()),
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
        title: AppbarTitle(text: "lbl_edit_profile".tr));
  }

  /// Section Widget
  Widget _buildInputField1(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_name".tr, style: CustomTextStyles.bodyLargeGray70001),
      SizedBox(height: 11.v),
      BlocSelector<EditProfileBloc, EditProfileState, TextEditingController?>(
          selector: (state) => state.nameController,
          builder: (context, nameController) {
            return CustomTextFormField(
                controller: nameController, hintText: "lbl_suzane_jobs".tr);
          })
    ]);
  }

  /// Section Widget
  Widget _buildInputField2(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_email".tr, style: CustomTextStyles.bodyLargeGray70001),
      SizedBox(height: 11.v),
      BlocSelector<EditProfileBloc, EditProfileState, TextEditingController?>(
          selector: (state) => state.emailController,
          builder: (context, emailController) {
            return CustomTextFormField(
                controller: emailController,
                hintText: "lbl_abc_gmail_com".tr,
                textInputType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null ||
                      (!isValidEmail(value, isRequired: true))) {
                    return "err_msg_please_enter_valid_email".tr;
                  }
                  return null;
                });
          })
    ]);
  }

  /// Section Widget
  Widget _buildInputField3(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_phone".tr, style: CustomTextStyles.bodyLargeGray70001),
      SizedBox(height: 11.v),
      BlocSelector<EditProfileBloc, EditProfileState, TextEditingController?>(
          selector: (state) => state.phoneController,
          builder: (context, phoneController) {
            return CustomTextFormField(
                controller: phoneController,
                hintText: "lbl_91_123456890".tr,
                textInputAction: TextInputAction.done);
          })
    ]);
  }

  /// Requests permission to access the camera and storage, and displays a model
  /// sheet for selecting images.
  ///
  /// Throws an error if permission is denied or an error occurs while selecting images.
  onTapProfile(BuildContext context) async {
    await PermissionManager.askForPermission(Permission.camera);
    await PermissionManager.askForPermission(Permission.storage);
    List<String?>? imageList = [];
    await FileManager().showModelSheetForImage(getImages: (value) async {
      imageList = value;
    });
  }
}
