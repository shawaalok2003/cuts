import 'package:aalok_s_application3/widgets/app_bar/custom_app_bar.dart';
import 'package:aalok_s_application3/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:aalok_s_application3/widgets/app_bar/appbar_title.dart';
import 'package:aalok_s_application3/presentation/receive_money_personal_page/receive_money_personal_page.dart';
import 'package:aalok_s_application3/presentation/receive_money_request_page/receive_money_request_page.dart';
import 'models/receive_money_request_tab_container_model.dart';
import 'package:flutter/material.dart';
import 'package:aalok_s_application3/core/app_export.dart';
import 'bloc/receive_money_request_tab_container_bloc.dart';

class ReceiveMoneyRequestTabContainerScreen extends StatefulWidget {
  const ReceiveMoneyRequestTabContainerScreen({Key? key})
      : super(
          key: key,
        );

  @override
  ReceiveMoneyRequestTabContainerScreenState createState() =>
      ReceiveMoneyRequestTabContainerScreenState();
  static Widget builder(BuildContext context) {
    return BlocProvider<ReceiveMoneyRequestTabContainerBloc>(
      create: (context) => ReceiveMoneyRequestTabContainerBloc(
          ReceiveMoneyRequestTabContainerState(
        receiveMoneyRequestTabContainerModelObj:
            ReceiveMoneyRequestTabContainerModel(),
      ))
        ..add(ReceiveMoneyRequestTabContainerInitialEvent()),
      child: ReceiveMoneyRequestTabContainerScreen(),
    );
  }
}

class ReceiveMoneyRequestTabContainerScreenState
    extends State<ReceiveMoneyRequestTabContainerScreen>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReceiveMoneyRequestTabContainerBloc,
        ReceiveMoneyRequestTabContainerState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: _buildAppBar(context),
            body: SizedBox(
              width: SizeUtils.width,
              child: SingleChildScrollView(
                padding: EdgeInsets.only(top: 34.v),
                child: Column(
                  children: [
                    _buildTabview(context),
                    SizedBox(
                      height: 1038.v,
                      child: TabBarView(
                        controller: tabviewController,
                        children: [
                          ReceiveMoneyPersonalPage.builder(context),
                          ReceiveMoneyRequestPage.builder(context),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
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
        text: "lbl_money_request".tr,
      ),
    );
  }

  /// Section Widget
  Widget _buildTabview(BuildContext context) {
    return Container(
      height: 65.v,
      width: 366.h,
      decoration: BoxDecoration(
        color: appTheme.gray300,
        borderRadius: BorderRadius.circular(
          8.h,
        ),
      ),
      child: TabBar(
        controller: tabviewController,
        labelPadding: EdgeInsets.zero,
        labelColor: theme.colorScheme.onPrimary,
        labelStyle: TextStyle(
          fontSize: 20.fSize,
          fontFamily: 'Overpass',
          fontWeight: FontWeight.w800,
        ),
        unselectedLabelColor: appTheme.gray500,
        unselectedLabelStyle: TextStyle(
          fontSize: 20.fSize,
          fontFamily: 'Overpass',
          fontWeight: FontWeight.w800,
        ),
        indicatorPadding: EdgeInsets.all(
          10.0.h,
        ),
        indicator: BoxDecoration(
          color: theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(
            4.h,
          ),
        ),
        tabs: [
          Tab(
            child: Text(
              "lbl_personal".tr,
            ),
          ),
          Tab(
            child: Text(
              "lbl_business".tr,
            ),
          ),
        ],
      ),
    );
  }
}
