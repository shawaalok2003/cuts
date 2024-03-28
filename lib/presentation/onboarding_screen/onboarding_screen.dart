import 'package:aalok_s_application3/widgets/custom_elevated_button.dart';
import 'models/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:aalok_s_application3/core/app_export.dart';
import 'bloc/onboarding_bloc.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<OnboardingBloc>(
        create: (context) => OnboardingBloc(
            OnboardingState(onboardingModelObj: OnboardingModel()))
          ..add(OnboardingInitialEvent()),
        child: OnboardingScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingBloc, OnboardingState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              body: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(horizontal: 24.h),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgThumbsUp, width: 78.h),
                        SizedBox(height: 26.v),
                        Text("msg_online_digital".tr,
                            style: CustomTextStyles.headlineSmallMedium),
                        SizedBox(height: 7.v),
                        Text("lbl_banking".tr,
                            style: theme.textTheme.displayMedium),
                        SizedBox(height: 29.v),
                        Container(
                            width: 294.h,
                            margin: EdgeInsets.symmetric(horizontal: 35.h),
                            child: Text("msg_we_help_our_user".tr,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: CustomTextStyles.bodyLargeGray600
                                    .copyWith(height: 1.50))),
                        SizedBox(height: 79.v),
                        CustomElevatedButton(
                            text: "lbl_start_now".tr.toUpperCase(),
                            onPressed: () {
                              onTapStartNow(context);
                            })
                      ]))));
    });
  }

  /// Navigates to the logInScreen when the action is triggered.
  onTapStartNow(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.logInScreen,
    );
  }
}
