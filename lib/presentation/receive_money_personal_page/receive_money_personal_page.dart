import 'package:aalok_s_application3/core/utils/validation_functions.dart';
import 'package:aalok_s_application3/widgets/custom_text_form_field.dart';
import 'package:aalok_s_application3/widgets/custom_elevated_button.dart';
import 'models/receive_money_personal_model.dart';
import 'package:flutter/material.dart';
import 'package:aalok_s_application3/core/app_export.dart';
import 'bloc/receive_money_personal_bloc.dart';

class ReceiveMoneyPersonalPage extends StatefulWidget {
  const ReceiveMoneyPersonalPage({Key? key}) : super(key: key);

  @override
  ReceiveMoneyPersonalPageState createState() =>
      ReceiveMoneyPersonalPageState();

  static Widget builder(BuildContext context) {
    return BlocProvider<ReceiveMoneyPersonalBloc>(
        create: (context) => ReceiveMoneyPersonalBloc(ReceiveMoneyPersonalState(
            receiveMoneyPersonalModelObj: ReceiveMoneyPersonalModel()))
          ..add(ReceiveMoneyPersonalInitialEvent()),
        child: ReceiveMoneyPersonalPage());
  }
}

// ignore_for_file: must_be_immutable
class ReceiveMoneyPersonalPageState extends State<ReceiveMoneyPersonalPage>
    with AutomaticKeepAliveClientMixin<ReceiveMoneyPersonalPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                    child: Column(children: [
                  SizedBox(height: 39.v),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.h),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildNameFrame(context),
                            SizedBox(height: 20.v),
                            _buildEmailInputField(context),
                            SizedBox(height: 21.v),
                            _buildCountryInputField1(context),
                            SizedBox(height: 20.v),
                            Padding(
                                padding: EdgeInsets.only(right: 107.h),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(bottom: 1.v),
                                          child: Text("lbl_amount".tr,
                                              style: CustomTextStyles
                                                  .bodyLargeGray70001)),
                                      Text("lbl_currency".tr,
                                          style: CustomTextStyles
                                              .bodyLargeGray70001)
                                    ])),
                            SizedBox(height: 10.v),
                            _buildAmount(context),
                            SizedBox(height: 21.v),
                            _buildMassageInputField(context),
                            SizedBox(height: 40.v),
                            _buildSendButton(context)
                          ]))
                ])))));
  }

  /// Section Widget
  Widget _buildFirstNameInputField(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 10.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("lbl_first_name".tr, style: CustomTextStyles.bodyLargeGray70001),
          SizedBox(height: 11.v),
          BlocSelector<ReceiveMoneyPersonalBloc, ReceiveMoneyPersonalState,
                  TextEditingController?>(
              selector: (state) => state.firstNameController,
              builder: (context, firstNameController) {
                return CustomTextFormField(
                    width: 173.h,
                    controller: firstNameController,
                    hintText: "lbl_name".tr,
                    validator: (value) {
                      if (!isText(value)) {
                        return "err_msg_please_enter_valid_text".tr;
                      }
                      return null;
                    });
              })
        ]));
  }

  /// Section Widget
  Widget _buildLastNameInputField(BuildContext context) {
    return BlocSelector<ReceiveMoneyPersonalBloc, ReceiveMoneyPersonalState,
            TextEditingController?>(
        selector: (state) => state.lastNameInputFieldController,
        builder: (context, lastNameInputFieldController) {
          return CustomTextFormField(
              width: 173.h,
              controller: lastNameInputFieldController,
              hintText: "lbl_name".tr,
              validator: (value) {
                if (!isText(value)) {
                  return "err_msg_please_enter_valid_text".tr;
                }
                return null;
              });
        });
  }

  /// Section Widget
  Widget _buildNameFrame(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      _buildFirstNameInputField(context),
      Padding(
          padding: EdgeInsets.only(left: 10.h),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("lbl_last_name".tr,
                style: CustomTextStyles.bodyLargeGray70001),
            SizedBox(height: 11.v),
            _buildLastNameInputField(context)
          ]))
    ]);
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return BlocSelector<ReceiveMoneyPersonalBloc, ReceiveMoneyPersonalState,
            TextEditingController?>(
        selector: (state) => state.emailController,
        builder: (context, emailController) {
          return CustomTextFormField(
              controller: emailController,
              hintText: "lbl_your_email_here".tr,
              textInputType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || (!isValidEmail(value, isRequired: true))) {
                  return "err_msg_please_enter_valid_email".tr;
                }
                return null;
              });
        });
  }

  /// Section Widget
  Widget _buildEmailInputField(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_email".tr, style: CustomTextStyles.bodyLargeGray70001),
      SizedBox(height: 11.v),
      _buildEmail(context)
    ]);
  }

  /// Section Widget
  Widget _buildCountryInputField(BuildContext context) {
    return BlocSelector<ReceiveMoneyPersonalBloc, ReceiveMoneyPersonalState,
            TextEditingController?>(
        selector: (state) => state.countryInputFieldController,
        builder: (context, countryInputFieldController) {
          return CustomTextFormField(
              controller: countryInputFieldController,
              hintText: "lbl_select_country".tr);
        });
  }

  /// Section Widget
  Widget _buildCountryInputField1(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_country".tr, style: CustomTextStyles.bodyLargeGray70001),
      SizedBox(height: 9.v),
      _buildCountryInputField(context)
    ]);
  }

  /// Section Widget
  Widget _buildCurrencyLabel(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.only(right: 10.h),
            child: BlocSelector<ReceiveMoneyPersonalBloc,
                    ReceiveMoneyPersonalState, TextEditingController?>(
                selector: (state) => state.currencyLabelController,
                builder: (context, currencyLabelController) {
                  return CustomTextFormField(
                      controller: currencyLabelController,
                      hintText: "lbl_0_00".tr);
                })));
  }

  /// Section Widget
  Widget _buildAmountInput(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.only(left: 10.h),
            child: BlocSelector<ReceiveMoneyPersonalBloc,
                    ReceiveMoneyPersonalState, TextEditingController?>(
                selector: (state) => state.amountInputController,
                builder: (context, amountInputController) {
                  return CustomTextFormField(
                      controller: amountInputController,
                      hintText: "lbl_usd".tr);
                })));
  }

  /// Section Widget
  Widget _buildAmount(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_buildCurrencyLabel(context), _buildAmountInput(context)]);
  }

  /// Section Widget
  Widget _buildMassageInput(BuildContext context) {
    return BlocSelector<ReceiveMoneyPersonalBloc, ReceiveMoneyPersonalState,
            TextEditingController?>(
        selector: (state) => state.massageInputController,
        builder: (context, massageInputController) {
          return CustomTextFormField(
              controller: massageInputController,
              hintText: "msg_write_a_short_note".tr,
              textInputAction: TextInputAction.done);
        });
  }

  /// Section Widget
  Widget _buildMassageInputField(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_massage".tr, style: CustomTextStyles.bodyLargeGray70001),
      SizedBox(height: 9.v),
      _buildMassageInput(context)
    ]);
  }

  /// Section Widget
  Widget _buildSendButton(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_send".tr.toUpperCase(),
        onPressed: () {
          onTapSendButton(context);
        });
  }

  /// Navigates to the requestSentScreen when the action is triggered.
  onTapSendButton(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.requestSentScreen,
    );
  }
}
