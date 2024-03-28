import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/profilelist_item_model.dart';
import '../models/thirtyeight_item_model.dart';
import 'package:aalok_s_application3/presentation/send_money_screen/models/send_money_model.dart';
part 'send_money_event.dart';
part 'send_money_state.dart';

/// A bloc that manages the state of a SendMoney according to the event that is dispatched to it.
class SendMoneyBloc extends Bloc<SendMoneyEvent, SendMoneyState> {
  SendMoneyBloc(SendMoneyState initialState) : super(initialState) {
    on<SendMoneyInitialEvent>(_onInitialize);
  }

  _onInitialize(
    SendMoneyInitialEvent event,
    Emitter<SendMoneyState> emit,
  ) async {
    emit(state.copyWith(
        sendMoneyModelObj: state.sendMoneyModelObj?.copyWith(
            profilelistItemList: fillProfilelistItemList(),
            thirtyeightItemList: fillThirtyeightItemList())));
    NavigatorService.pushNamed(
      AppRoutes.enterMoneyScreen,
    );
  }

  List<ProfilelistItemModel> fillProfilelistItemList() {
    return [
      ProfilelistItemModel(ellipse: ImageConstant.imgEllipse11),
      ProfilelistItemModel(ellipse: ImageConstant.imgEllipse9),
      ProfilelistItemModel(ellipse: ImageConstant.imgEllipse8),
      ProfilelistItemModel(ellipse: ImageConstant.imgEllipse7),
      ProfilelistItemModel(ellipse: ImageConstant.imgEllipse10)
    ];
  }

  List<ThirtyeightItemModel> fillThirtyeightItemList() {
    return [
      ThirtyeightItemModel(
          belgeman: ImageConstant.imgOval1,
          jenningsChamplin: "Belgeman",
          jenningsChamplin1: "AC : 159-107-1396"),
      ThirtyeightItemModel(
          belgeman: ImageConstant.imgOval2,
          jenningsChamplin: "Brusly",
          jenningsChamplin1: "AC : 159-107-1396"),
      ThirtyeightItemModel(
          belgeman: ImageConstant.imgOval3,
          jenningsChamplin: "Baminu",
          jenningsChamplin1: "AC : 159-107-1396")
    ];
  }
}
