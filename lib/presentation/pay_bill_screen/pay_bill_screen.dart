import 'package:aalok_s_application3/widgets/app_bar/custom_app_bar.dart';
import 'package:aalok_s_application3/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:aalok_s_application3/widgets/app_bar/appbar_title.dart';
import 'widgets/paybill_item_widget.dart';
import 'models/paybill_item_model.dart';
import 'models/pay_bill_model.dart';
import 'package:flutter/material.dart';
import 'package:aalok_s_application3/core/app_export.dart';
import 'bloc/pay_bill_bloc.dart';

class PayBillScreen extends StatelessWidget {
  const PayBillScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<PayBillBloc>(
        create: (context) =>
            PayBillBloc(PayBillState(payBillModelObj: PayBillModel()))
              ..add(PayBillInitialEvent()),
        child: PayBillScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Padding(
                padding: EdgeInsets.only(left: 24.h, top: 34.v, right: 24.h),
                child: BlocSelector<PayBillBloc, PayBillState, PayBillModel?>(
                    selector: (state) => state.payBillModelObj,
                    builder: (context, payBillModelObj) {
                      return GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: 223.v,
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 24.h,
                                  crossAxisSpacing: 24.h),
                          physics: NeverScrollableScrollPhysics(),
                          itemCount:
                              payBillModelObj?.paybillItemList.length ?? 0,
                          itemBuilder: (context, index) {
                            PaybillItemModel model =
                                payBillModelObj?.paybillItemList[index] ??
                                    PaybillItemModel();
                            return PaybillItemWidget(model, onTapOne: () {
                              onTapOne(context);
                            });
                          });
                    }))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 68.h,
        leading: AppbarLeadingIconbutton(
            imagePath: ImageConstant.imgFavoriteOnprimary,
            margin: EdgeInsets.only(left: 24.h, top: 6.v, bottom: 6.v)),
        centerTitle: true,
        title: AppbarTitle(text: "lbl_pay_bills2".tr));
  }

  /// Navigates to the electricBillScreen when the action is triggered.
  onTapOne(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.electricBillScreen,
    );
  }
}
