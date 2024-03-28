import 'package:aalok_s_application3/widgets/custom_icon_button.dart';
import 'widgets/optionssection_item_widget.dart';
import 'models/optionssection_item_model.dart';
import 'models/home_model.dart';
import 'package:flutter/material.dart';
import 'package:aalok_s_application3/core/app_export.dart';
import 'bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<HomeBloc>(
        create: (context) => HomeBloc(HomeState(homeModelObj: HomeModel()))
          ..add(HomeInitialEvent()),
        child: HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                decoration: AppDecoration.bg,
                child: Column(children: [
                  SizedBox(height: 40.v),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Container(
                              margin: EdgeInsets.only(bottom: 5.v),
                              padding: EdgeInsets.symmetric(horizontal: 24.h),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomIconButton(
                                              height: 44.adaptSize,
                                              width: 44.adaptSize,
                                              padding: EdgeInsets.all(10.h),
                                              child: CustomImageView(
                                                  imagePath:
                                                      ImageConstant.imgGrid)),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 68.h,
                                                  top: 6.v,
                                                  bottom: 11.v),
                                              child: Text("lbl_welcome_back".tr,
                                                  style: theme
                                                      .textTheme.titleLarge))
                                        ]),
                                    SizedBox(height: 40.v),
                                    _buildTotalBalanceSection(context),
                                    SizedBox(height: 40.v),
                                    _buildOptionsSection(context)
                                  ]))))
                ]))));
  }

  /// Section Widget
  Widget _buildTotalBalanceSection(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 104.h, vertical: 18.v),
        decoration: AppDecoration.fillPrimary,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("lbl_total_balance".tr,
              style: CustomTextStyles.bodyLargeOnPrimary),
          SizedBox(height: 4.v),
          Text("lbl_3_567_12".tr, style: CustomTextStyles.displaySmallOnPrimary)
        ]));
  }

  /// Section Widget
  Widget _buildOptionsSection(BuildContext context) {
    return BlocSelector<HomeBloc, HomeState, HomeModel?>(
        selector: (state) => state.homeModelObj,
        builder: (context, homeModelObj) {
          return GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 199.v,
                  crossAxisCount: 2,
                  mainAxisSpacing: 24.h,
                  crossAxisSpacing: 24.h),
              physics: NeverScrollableScrollPhysics(),
              itemCount: homeModelObj?.optionssectionItemList.length ?? 0,
              itemBuilder: (context, index) {
                OptionssectionItemModel model =
                    homeModelObj?.optionssectionItemList[index] ??
                        OptionssectionItemModel();
                return OptionssectionItemWidget(model, onTapOne: () {
                  onTapOne(context);
                });
              });
        });
  }

  /// Navigates to the mobilePrepaidOneScreen when the action is triggered.
  onTapOne(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.mobilePrepaidOneScreen,
    );
  }
}
