import 'package:aalok_s_application3/widgets/app_bar/custom_app_bar.dart';
import 'package:aalok_s_application3/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:aalok_s_application3/widgets/app_bar/appbar_title.dart';
import 'package:aalok_s_application3/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'widgets/cards_item_widget.dart';
import 'models/cards_item_model.dart';
import 'models/cards_model.dart';
import 'package:flutter/material.dart';
import 'package:aalok_s_application3/core/app_export.dart';
import 'bloc/cards_bloc.dart';

class CardsPage extends StatelessWidget {
  const CardsPage({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<CardsBloc>(
        create: (context) => CardsBloc(CardsState(cardsModelObj: CardsModel()))
          ..add(CardsInitialEvent()),
        child: CardsPage());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                decoration: AppDecoration.bg,
                child: Column(children: [
                  SizedBox(height: 34.v),
                  _buildCards(context),
                  Spacer()
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 68.h,
        leading: AppbarLeadingIconbutton(
            imagePath: ImageConstant.imgGrid,
            margin: EdgeInsets.only(left: 24.h, top: 6.v, bottom: 6.v)),
        centerTitle: true,
        title: AppbarTitle(text: "lbl_your_cards".tr),
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
  Widget _buildCards(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: BlocSelector<CardsBloc, CardsState, CardsModel?>(
            selector: (state) => state.cardsModelObj,
            builder: (context, cardsModelObj) {
              return ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 36.v);
                  },
                  itemCount: cardsModelObj?.cardsItemList.length ?? 0,
                  itemBuilder: (context, index) {
                    CardsItemModel model =
                        cardsModelObj?.cardsItemList[index] ?? CardsItemModel();
                    return CardsItemWidget(model, onTapCard: () {
                      onTapCard(context);
                    });
                  });
            }));
  }

  /// Navigates to the addCardOneScreen when the action is triggered.
  onTapPlus(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.addCardOneScreen,
    );
  }

  /// Navigates to the cardDetailsScreen when the action is triggered.
  onTapCard(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.cardDetailsScreen,
    );
  }
}
