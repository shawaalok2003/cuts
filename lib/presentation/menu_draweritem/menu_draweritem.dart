import 'package:flutter/material.dart';
import 'package:aalok_s_application3/core/app_export.dart';
import 'bloc/menu_bloc.dart';

class MenuDraweritem extends StatelessWidget {
  const MenuDraweritem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
            width: 335.h,
            padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 77.v),
            decoration: AppDecoration.bg,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CustomImageView(
                  imagePath: ImageConstant.imgEllipse108,
                  height: 85.adaptSize,
                  width: 85.adaptSize,
                  radius: BorderRadius.circular(42.h)),
              SizedBox(height: 19.v),
              Text("lbl_suzane_jobs".tr, style: theme.textTheme.headlineSmall),
              SizedBox(height: 10.v),
              Text("lbl_user_gmail_com".tr,
                  style: CustomTextStyles.titleSmallGray500),
              SizedBox(height: 41.v),
              GestureDetector(
                  onTap: () {
                    onTapFrame(context);
                  },
                  child: Padding(
                      padding: EdgeInsets.only(left: 2.h),
                      child: Row(children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgLock,
                            height: 20.adaptSize,
                            width: 20.adaptSize,
                            margin: EdgeInsets.only(top: 2.v)),
                        Padding(
                            padding: EdgeInsets.only(left: 16.h),
                            child: Text("lbl_edit_profile".tr,
                                style: CustomTextStyles.titleMediumMedium))
                      ]))),
              SizedBox(height: 43.v),
              GestureDetector(
                  onTap: () {
                    onTapTransaction(context);
                  },
                  child: Row(children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgClock,
                        height: 20.adaptSize,
                        width: 20.adaptSize),
                    Padding(
                        padding: EdgeInsets.only(left: 16.h),
                        child: Text("lbl_history_8".tr,
                            style: CustomTextStyles.titleMediumMedium))
                  ])),
              SizedBox(height: 43.v),
              GestureDetector(
                  onTap: () {
                    onTapSettings(context);
                  },
                  child: Row(children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgSearch,
                        height: 20.adaptSize,
                        width: 20.adaptSize),
                    Padding(
                        padding: EdgeInsets.only(left: 16.h),
                        child: Text("msg_notifications_settings".tr,
                            style: CustomTextStyles.titleMediumMedium))
                  ])),
              SizedBox(height: 42.v),
              Row(children: [
                CustomImageView(
                    imagePath: ImageConstant.imgFavoriteOnprimarycontainer,
                    height: 20.adaptSize,
                    width: 20.adaptSize),
                Padding(
                    padding: EdgeInsets.only(left: 16.h),
                    child: Text("lbl_share_app".tr,
                        style: CustomTextStyles.titleMediumMedium))
              ]),
              SizedBox(height: 42.v)
            ])));
  }

  /// Navigates to the editProfileScreen when the action is triggered.
  onTapFrame(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.editProfileScreen,
    );
  }

  /// Navigates to the historyScreen when the action is triggered.
  onTapTransaction(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.historyScreen,
    );
  }

  /// Navigates to the notificationsScreen when the action is triggered.
  onTapSettings(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.notificationsScreen,
    );
  }
}
