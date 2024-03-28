import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/paybill_item_model.dart';
import 'package:aalok_s_application3/presentation/pay_bill_screen/models/pay_bill_model.dart';
part 'pay_bill_event.dart';
part 'pay_bill_state.dart';

/// A bloc that manages the state of a PayBill according to the event that is dispatched to it.
class PayBillBloc extends Bloc<PayBillEvent, PayBillState> {
  PayBillBloc(PayBillState initialState) : super(initialState) {
    on<PayBillInitialEvent>(_onInitialize);
  }

  _onInitialize(
    PayBillInitialEvent event,
    Emitter<PayBillState> emit,
  ) async {
    emit(state.copyWith(
        payBillModelObj: state.payBillModelObj
            ?.copyWith(paybillItemList: fillPaybillItemList())));
    NavigatorService.pushNamed(
      AppRoutes.electricBillScreen,
    );
  }

  List<PaybillItemModel> fillPaybillItemList() {
    return [
      PaybillItemModel(
          electricityBill: ImageConstant.imgUserYellowA400,
          electricityBill1: "Electricity\nBill",
          card: "Pay bill of this month"),
      PaybillItemModel(
          electricityBill: ImageConstant.imgVideoCamera,
          electricityBill1: "Water\nBill",
          card: "Pay bill of this month"),
      PaybillItemModel(
          electricityBill: ImageConstant.imgForward,
          electricityBill1: "Network\nBill",
          card: "Pay bill of this month")
    ];
  }
}
