import 'package:aalok_s_application3/widgets/app_bar/custom_app_bar.dart';
import 'package:aalok_s_application3/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:aalok_s_application3/widgets/app_bar/appbar_title.dart';
import 'package:aalok_s_application3/widgets/custom_switch.dart';
import 'models/notifications_model.dart';
import 'package:flutter/material.dart';
import 'package:aalok_s_application3/core/app_export.dart';
import 'bloc/notifications_bloc.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<NotificationsBloc>(
      create: (context) => NotificationsBloc(NotificationsState(
        notificationsModelObj: NotificationsModel(),
      ))
        ..add(NotificationsInitialEvent()),
      child: NotificationsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 24.h,
            vertical: 35.v,
          ),
          child: Column(
            children: [
              _buildOne(context),
              SizedBox(height: 25.v),
              _buildTwo(context),
              SizedBox(height: 28.v),
              _buildThree(context),
              SizedBox(height: 25.v),
              _buildFour(context),
              SizedBox(height: 27.v),
              _buildFive(context),
              SizedBox(height: 27.v),
              _buildSix(context),
              SizedBox(height: 25.v),
              _buildSeven(context),
              SizedBox(height: 25.v),
              _buildEight(context),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 68.h,
      leading: AppbarLeadingIconbutton(
        imagePath: ImageConstant.imgFavoriteOnprimary,
        margin: EdgeInsets.only(
          left: 24.h,
          top: 6.v,
          bottom: 6.v,
        ),
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "lbl_notifications".tr,
      ),
    );
  }

  /// Section Widget
  Widget _buildOne(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "lbl_money_receive".tr,
              style: theme.textTheme.titleMedium,
            ),
            SizedBox(height: 8.v),
            Text(
              "msg_if_anyone_sent_you".tr,
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
        BlocSelector<NotificationsBloc, NotificationsState, bool?>(
          selector: (state) => state.isSelectedSwitch,
          builder: (context, isSelectedSwitch) {
            return CustomSwitch(
              margin: EdgeInsets.symmetric(vertical: 11.v),
              value: isSelectedSwitch,
              onChange: (value) {
                context
                    .read<NotificationsBloc>()
                    .add(ChangeSwitchEvent(value: value));
              },
            );
          },
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildTwo(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "lbl_card_activation".tr,
              style: theme.textTheme.titleMedium,
            ),
            SizedBox(height: 8.v),
            Text(
              "lbl_if_card_active".tr,
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
        BlocSelector<NotificationsBloc, NotificationsState, bool?>(
          selector: (state) => state.isSelectedSwitch1,
          builder: (context, isSelectedSwitch1) {
            return CustomSwitch(
              margin: EdgeInsets.only(
                top: 13.v,
                bottom: 10.v,
              ),
              value: isSelectedSwitch1,
              onChange: (value) {
                context
                    .read<NotificationsBloc>()
                    .add(ChangeSwitch1Event(value: value));
              },
            );
          },
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildThree(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "lbl_update_feature".tr,
              style: theme.textTheme.titleMedium,
            ),
            SizedBox(height: 8.v),
            Text(
              "msg_if_any_new_update".tr,
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
        BlocSelector<NotificationsBloc, NotificationsState, bool?>(
          selector: (state) => state.isSelectedSwitch2,
          builder: (context, isSelectedSwitch2) {
            return CustomSwitch(
              margin: EdgeInsets.symmetric(vertical: 11.v),
              value: isSelectedSwitch2,
              onChange: (value) {
                context
                    .read<NotificationsBloc>()
                    .add(ChangeSwitch2Event(value: value));
              },
            );
          },
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildFour(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "lbl_cash_in".tr,
              style: theme.textTheme.titleMedium,
            ),
            SizedBox(height: 9.v),
            Text(
              "msg_if_any_cash_in_your".tr,
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
        BlocSelector<NotificationsBloc, NotificationsState, bool?>(
          selector: (state) => state.isSelectedSwitch3,
          builder: (context, isSelectedSwitch3) {
            return CustomSwitch(
              margin: EdgeInsets.only(
                top: 13.v,
                bottom: 11.v,
              ),
              value: isSelectedSwitch3,
              onChange: (value) {
                context
                    .read<NotificationsBloc>()
                    .add(ChangeSwitch3Event(value: value));
              },
            );
          },
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildFive(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "lbl_money_request".tr,
              style: theme.textTheme.titleMedium,
            ),
            SizedBox(height: 8.v),
            Text(
              "msg_if_anyone_sent_you2".tr,
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
        BlocSelector<NotificationsBloc, NotificationsState, bool?>(
          selector: (state) => state.isSelectedSwitch4,
          builder: (context, isSelectedSwitch4) {
            return CustomSwitch(
              margin: EdgeInsets.symmetric(vertical: 11.v),
              value: isSelectedSwitch4,
              onChange: (value) {
                context
                    .read<NotificationsBloc>()
                    .add(ChangeSwitch4Event(value: value));
              },
            );
          },
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildSix(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "lbl_money_trasfer".tr,
              style: theme.textTheme.titleMedium,
            ),
            SizedBox(height: 7.v),
            Text(
              "msg_if_you_sent_money".tr,
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
        BlocSelector<NotificationsBloc, NotificationsState, bool?>(
          selector: (state) => state.isSelectedSwitch5,
          builder: (context, isSelectedSwitch5) {
            return CustomSwitch(
              margin: EdgeInsets.symmetric(vertical: 11.v),
              value: isSelectedSwitch5,
              onChange: (value) {
                context
                    .read<NotificationsBloc>()
                    .add(ChangeSwitch5Event(value: value));
              },
            );
          },
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildSeven(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "msg_number_notification".tr,
              style: theme.textTheme.titleMedium,
            ),
            SizedBox(height: 9.v),
            Text(
              "msg_send_notification".tr,
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
        BlocSelector<NotificationsBloc, NotificationsState, bool?>(
          selector: (state) => state.isSelectedSwitch6,
          builder: (context, isSelectedSwitch6) {
            return CustomSwitch(
              margin: EdgeInsets.only(
                top: 13.v,
                bottom: 11.v,
              ),
              value: isSelectedSwitch6,
              onChange: (value) {
                context
                    .read<NotificationsBloc>()
                    .add(ChangeSwitch6Event(value: value));
              },
            );
          },
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildEight(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "msg_email_notification".tr,
              style: theme.textTheme.titleMedium,
            ),
            SizedBox(height: 9.v),
            Text(
              "msg_send_notification2".tr,
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
        BlocSelector<NotificationsBloc, NotificationsState, bool?>(
          selector: (state) => state.isSelectedSwitch7,
          builder: (context, isSelectedSwitch7) {
            return CustomSwitch(
              margin: EdgeInsets.only(
                top: 13.v,
                bottom: 11.v,
              ),
              value: isSelectedSwitch7,
              onChange: (value) {
                context
                    .read<NotificationsBloc>()
                    .add(ChangeSwitch7Event(value: value));
              },
            );
          },
        ),
      ],
    );
  }
}
