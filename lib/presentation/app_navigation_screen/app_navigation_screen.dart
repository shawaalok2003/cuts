import 'models/app_navigation_model.dart';
import 'package:flutter/material.dart';
import 'package:aalok_s_application3/core/app_export.dart';
import 'bloc/app_navigation_bloc.dart';

class AppNavigationScreen extends StatelessWidget {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<AppNavigationBloc>(
      create: (context) => AppNavigationBloc(AppNavigationState(
        appNavigationModelObj: AppNavigationModel(),
      ))
        ..add(AppNavigationInitialEvent()),
      child: AppNavigationScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppNavigationBloc, AppNavigationState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Color(0XFFFFFFFF),
            body: SizedBox(
              width: 375.h,
              child: Column(
                children: [
                  _buildAppNavigation(context),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0XFFFFFFFF),
                        ),
                        child: Column(
                          children: [
                            _buildScreenTitle(
                              context,
                              screenTitle: "Splash".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.splashScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Onboarding".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.onboardingScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Log In".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.logInScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Sign up".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.signUpScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Home - Container".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.homeContainerScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Card Details".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.cardDetailsScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Edit Profile".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.editProfileScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "History".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.historyScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Notifications".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.notificationsScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Send Money".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.sendMoneyScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Enter Money".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.enterMoneyScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Send Money - Enter Password".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.sendMoneyEnterPasswordScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Add Person".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.addPersonScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Add card#One".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.addCardOneScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Payment Success".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.paymentSuccessScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle:
                                  "Receive Money Request - Tab Container".tr,
                              onTapScreenTitle: () => onTapScreenTitle(AppRoutes
                                  .receiveMoneyRequestTabContainerScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Request sent".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.requestSentScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Money Exchange".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.moneyExchangeScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Pay Bill".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.payBillScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Electric Bill".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.electricBillScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Bil Payment Success".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.bilPaymentSuccessScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Bank To bank#One".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.bankToBankOneScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Bank To bank#Two".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.bankToBankTwoScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Bank To bank#Three".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.bankToBankThreeScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Money Sent Success".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.moneySentSuccessScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Mobile Prepaid#One".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.mobilePrepaidOneScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Mobile Prepaid#Two".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.mobilePrepaidTwoScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Mobile Prepaid#Three".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.mobilePrepaidThreeScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Recharge Success".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.rechargeSuccessScreen),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildAppNavigation(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                "App Navigation".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "Check your app's UI from the below demo screens of your app."
                    .tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF888888),
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: Color(0XFF000000),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle(
    BuildContext context, {
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle?.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  screenTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(String routeName) {
    NavigatorService.pushNamed(routeName);
  }
}
