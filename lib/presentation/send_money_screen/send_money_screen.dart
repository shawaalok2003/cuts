import 'package:aalok_s_application3/widgets/app_bar/custom_app_bar.dart';
import 'package:aalok_s_application3/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:aalok_s_application3/widgets/app_bar/appbar_title.dart';
import 'package:aalok_s_application3/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'widgets/profilelist_item_widget.dart';
import 'models/profilelist_item_model.dart';
import 'models/send_money_model.dart';
import 'widgets/thirtyeight_item_widget.dart';
import 'models/thirtyeight_item_model.dart';
import 'package:flutter/material.dart';
import 'package:aalok_s_application3/core/app_export.dart';
import 'bloc/send_money_bloc.dart';

class SendMoneyScreen extends StatelessWidget {
  const SendMoneyScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<SendMoneyBloc>(
        create: (context) =>
            SendMoneyBloc(SendMoneyState(sendMoneyModelObj: SendMoneyModel()))
              ..add(SendMoneyInitialEvent()),
        child: SendMoneyScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 33.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 14.h),
                          child: Text("lbl_favorite".tr,
                              style: theme.textTheme.headlineSmall)),
                      SizedBox(height: 17.v),
                      _buildProfileList(context),
                      SizedBox(height: 39.v),
                      Padding(
                          padding: EdgeInsets.only(left: 14.h),
                          child: Text("lbl_all_contact".tr,
                              style: theme.textTheme.headlineSmall)),
                      SizedBox(height: 25.v),
                      _buildA(context),
                      SizedBox(height: 24.v),
                      _buildB(context),
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
  Widget _buildProfileList(BuildContext context) {
    return SizedBox(
        height: 60.v,
        child: BlocSelector<SendMoneyBloc, SendMoneyState, SendMoneyModel?>(
            selector: (state) => state.sendMoneyModelObj,
            builder: (context, sendMoneyModelObj) {
              return ListView.separated(
                  padding: EdgeInsets.only(left: 14.h),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 20.h);
                  },
                  itemCount: sendMoneyModelObj?.profilelistItemList.length ?? 0,
                  itemBuilder: (context, index) {
                    ProfilelistItemModel model =
                        sendMoneyModelObj?.profilelistItemList[index] ??
                            ProfilelistItemModel();
                    return ProfilelistItemWidget(model);
                  });
            }));
  }

  /// Section Widget
  Widget _buildA(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 14.h),
            padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 16.v),
            decoration: AppDecoration.white,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("lbl_a".tr, style: theme.textTheme.headlineMedium),
              SizedBox(height: 9.v),
              Divider(color: appTheme.gray400),
              SizedBox(height: 19.v),
              GestureDetector(
                  onTap: () {
                    onTapOval(context);
                  },
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgOval,
                            height: 48.adaptSize,
                            width: 48.adaptSize,
                            radius: BorderRadius.circular(24.h)),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 10.h, top: 3.v, bottom: 4.v),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("lbl_angelina_druff".tr,
                                      style: theme.textTheme.titleMedium),
                                  SizedBox(height: 3.v),
                                  Text("msg_ac_159_107_1396".tr,
                                      style: CustomTextStyles
                                          .bodySmallOnPrimaryContainer)
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
                              style:
                                  CustomTextStyles.bodySmallOnPrimaryContainer)
                        ])),
                Spacer(),
                CustomImageView(
                    imagePath: ImageConstant.imgCheckmarkGray400,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                    margin: EdgeInsets.symmetric(vertical: 12.v))
              ]),
              SizedBox(height: 3.v)
            ])));
  }

  /// Section Widget
  Widget _buildB(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 14.h),
            padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 16.v),
            decoration: AppDecoration.white,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("lbl_b".tr, style: theme.textTheme.headlineMedium),
              SizedBox(height: 9.v),
              Divider(color: appTheme.gray400),
              SizedBox(height: 19.v),
              BlocSelector<SendMoneyBloc, SendMoneyState, SendMoneyModel?>(
                  selector: (state) => state.sendMoneyModelObj,
                  builder: (context, sendMoneyModelObj) {
                    return ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 16.v);
                        },
                        itemCount:
                            sendMoneyModelObj?.thirtyeightItemList.length ?? 0,
                        itemBuilder: (context, index) {
                          ThirtyeightItemModel model =
                              sendMoneyModelObj?.thirtyeightItemList[index] ??
                                  ThirtyeightItemModel();
                          return ThirtyeightItemWidget(model);
                        });
                  }),
              SizedBox(height: 3.v)
            ])));
  }

  /// Navigates to the addPersonScreen when the action is triggered.
  onTapPlus(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.addPersonScreen,
    );
  }

  /// Navigates to the enterMoneyScreen when the action is triggered.
  onTapOval(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.enterMoneyScreen,
    );
  }
}
