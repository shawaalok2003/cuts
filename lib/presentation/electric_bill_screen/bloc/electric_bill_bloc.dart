import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/electricbill_item_model.dart';
import 'package:aalok_s_application3/presentation/electric_bill_screen/models/electric_bill_model.dart';
part 'electric_bill_event.dart';
part 'electric_bill_state.dart';

/// A bloc that manages the state of a ElectricBill according to the event that is dispatched to it.
class ElectricBillBloc extends Bloc<ElectricBillEvent, ElectricBillState> {
  ElectricBillBloc(ElectricBillState initialState) : super(initialState) {
    on<ElectricBillInitialEvent>(_onInitialize);
  }

  List<ElectricbillItemModel> fillElectricbillItemList() {
    return [
      ElectricbillItemModel(
          jonathanAnderson: "Jonathan Anderson",
          text: "1222 3443 9881 1222",
          balance: "Balance",
          price: " 31,250")
    ];
  }

  _onInitialize(
    ElectricBillInitialEvent event,
    Emitter<ElectricBillState> emit,
  ) async {
    emit(state.copyWith(
        nameController: TextEditingController(),
        addressController: TextEditingController(),
        phoneController: TextEditingController(),
        inputsController: TextEditingController(),
        dateController: TextEditingController(),
        dateController1: TextEditingController()));
    emit(state.copyWith(
        electricBillModelObj: state.electricBillModelObj
            ?.copyWith(electricbillItemList: fillElectricbillItemList())));
    NavigatorService.pushNamed(
      AppRoutes.bilPaymentSuccessScreen,
    );
  }
}
