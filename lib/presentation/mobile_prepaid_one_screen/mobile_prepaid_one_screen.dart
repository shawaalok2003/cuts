import 'package:aalok_s_application3/widgets/app_bar/custom_app_bar.dart';
import 'package:aalok_s_application3/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:aalok_s_application3/widgets/app_bar/appbar_title.dart';
import 'package:aalok_s_application3/core/utils/validation_functions.dart';
import 'package:aalok_s_application3/widgets/custom_text_form_field.dart';
import 'widgets/profilelist1_item_widget.dart';
import 'models/profilelist1_item_model.dart';
import 'models/mobile_prepaid_one_model.dart';
import 'package:flutter/material.dart';
import 'package:aalok_s_application3/core/app_export.dart';
import 'bloc/mobile_prepaid_one_bloc.dart';

// ignore_for_file: must_be_immutable
class MobilePrepaidOneScreen extends StatelessWidget {
  MobilePrepaidOneScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<MobilePrepaidOneBloc>(
        create: (context) => MobilePrepaidOneBloc(MobilePrepaidOneState(
            mobilePrepaidOneModelObj: MobilePrepaidOneModel()))
          ..add(MobilePrepaidOneInitialEvent()),
        child: MobilePrepaidOneScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 35.v),
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.h),
                        child: Column(children: [
                          _buildInputField(context),
                          SizedBox(height: 39.v),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding: EdgeInsets.only(left: 14.h),
                                  child: Text("lbl_recent".tr,
                                      style: theme.textTheme.headlineSmall))),
                          SizedBox(height: 17.v),
                          _buildProfileList(context),
                          SizedBox(height: 39.v),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding: EdgeInsets.only(left: 14.h),
                                  child: Text("lbl_all_contact".tr,
                                      style: theme.textTheme.headlineSmall))),
                          SizedBox(height: 25.v),
                          _buildColumnA(context),
                          SizedBox(height: 24.v),
                          _buildColumnB(context)
                        ]))))));
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

  /// Section Widget
  Widget _buildInputField(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 17.h, right: 11.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("lbl_prepaid_to".tr, style: CustomTextStyles.bodyLargeGray70001),
          SizedBox(height: 9.v),
          BlocSelector<MobilePrepaidOneBloc, MobilePrepaidOneState,
                  TextEditingController?>(
              selector: (state) => state.nameController,
              builder: (context, nameController) {
                return CustomTextFormField(
                    controller: nameController,
                    hintText: "lbl_name_or_number".tr,
                    textInputAction: TextInputAction.done,
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
  Widget _buildProfileList(BuildContext context) {
    return SizedBox(
        height: 60.v,
        child: BlocSelector<MobilePrepaidOneBloc, MobilePrepaidOneState,
                MobilePrepaidOneModel?>(
            selector: (state) => state.mobilePrepaidOneModelObj,
            builder: (context, mobilePrepaidOneModelObj) {
              return ListView.separated(
                  padding: EdgeInsets.only(left: 14.h),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 20.h);
                  },
                  itemCount:
                      mobilePrepaidOneModelObj?.profilelist1ItemList.length ??
                          0,
                  itemBuilder: (context, index) {
                    Profilelist1ItemModel model =
                        mobilePrepaidOneModelObj?.profilelist1ItemList[index] ??
                            Profilelist1ItemModel();
                    return Profilelist1ItemWidget(model);
                  });
            }));
  }

  /// Section Widget
  Widget _buildColumnA(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 14.h),
        padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 16.v),
        decoration: AppDecoration.white,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("lbl_a".tr, style: theme.textTheme.headlineMedium),
          SizedBox(height: 9.v),
          Divider(color: appTheme.gray400),
          SizedBox(height: 19.v),
          GestureDetector(
              onTap: () {
                onTapOval(context);
              },
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                CustomImageView(
                    imagePath: ImageConstant.imgOval,
                    height: 48.adaptSize,
                    width: 48.adaptSize,
                    radius: BorderRadius.circular(24.h)),
                Padding(
                    padding: EdgeInsets.only(left: 10.h, top: 3.v, bottom: 4.v),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("lbl_angelina_druff".tr,
                              style: theme.textTheme.titleMedium),
                          SizedBox(height: 3.v),
                          Text("msg_ac_159_107_1396".tr,
                              style:
                                  CustomTextStyles.bodySmallOnPrimaryContainer)
                        ])),
                Spacer(),
                CustomImageView(
                    imagePath: ImageConstant.imgCheckmarkTeal300,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                    margin: EdgeInsets.symmetric(vertical: 12.v))
              ])),
          SizedBox(height: 16.v),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            CustomImageView(
                imagePath: ImageConstant.imgOval48x48,
                height: 48.adaptSize,
                width: 48.adaptSize,
                radius: BorderRadius.circular(24.h)),
            Padding(
                padding: EdgeInsets.only(left: 10.h, top: 3.v, bottom: 4.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                          alignment: Alignment.center,
                          child: Text("lbl_angelina_lan".tr,
                              style: theme.textTheme.titleMedium)),
                      SizedBox(height: 3.v),
                      Text("msg_ac_159_107_1396".tr,
                          style: CustomTextStyles.bodySmallOnPrimaryContainer)
                    ])),
            Spacer(),
            CustomImageView(
                imagePath: ImageConstant.imgCheckmarkGray400,
                height: 24.adaptSize,
                width: 24.adaptSize,
                margin: EdgeInsets.symmetric(vertical: 12.v))
          ]),
          SizedBox(height: 3.v)
        ]));
  }

  /// Section Widget
  Widget _buildColumnB(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 14.h),
        padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 16.v),
        decoration: AppDecoration.white,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("lbl_b".tr, style: theme.textTheme.headlineMedium),
          SizedBox(height: 9.v),
          Divider(color: appTheme.gray400),
          SizedBox(height: 19.v),
          _buildRowB(context,
              titleText: "lbl_belgeman".tr, bodyText: "msg_ac_159_107_1396".tr),
          SizedBox(height: 16.v),
          _buildRowB(context,
              titleText: "lbl_brusly".tr, bodyText: "msg_ac_159_107_1396".tr),
          SizedBox(height: 16.v),
          _buildRowB(context,
              titleText: "lbl_baminu".tr, bodyText: "msg_ac_159_107_1396".tr),
          SizedBox(height: 3.v)
        ]));
  }

  /// Common widget
  Widget _buildRowB(
    BuildContext context, {
    required String titleText,
    required String bodyText,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      CustomImageView(
          imagePath: ImageConstant.imgOval2,
          height: 48.adaptSize,
          width: 48.adaptSize,
          radius: BorderRadius.circular(24.h)),
      Padding(
          padding: EdgeInsets.only(left: 16.h, top: 3.v, bottom: 4.v),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(titleText,
                style: theme.textTheme.titleMedium!
                    .copyWith(color: theme.colorScheme.onPrimaryContainer)),
            SizedBox(height: 3.v),
            Text(bodyText,
                style: CustomTextStyles.bodySmallOnPrimaryContainer
                    .copyWith(color: theme.colorScheme.onPrimaryContainer))
          ])),
      Spacer(),
      CustomImageView(
          imagePath: ImageConstant.imgCheckmarkGray400,
          height: 24.adaptSize,
          width: 24.adaptSize,
          margin: EdgeInsets.symmetric(vertical: 12.v))
    ]);
  }

  /// Navigates to the enterMoneyScreen when the action is triggered.
  onTapOval(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.enterMoneyScreen,
    );
  }
}
