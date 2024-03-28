import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/optionssection_item_model.dart';
import 'package:aalok_s_application3/presentation/home_page/models/home_model.dart';
part 'home_event.dart';
part 'home_state.dart';

/// A bloc that manages the state of a Home according to the event that is dispatched to it.
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(HomeState initialState) : super(initialState) {
    on<HomeInitialEvent>(_onInitialize);
  }

  _onInitialize(
    HomeInitialEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(
        homeModelObj: state.homeModelObj
            ?.copyWith(optionssectionItemList: fillOptionssectionItemList())));
  }

  List<OptionssectionItemModel> fillOptionssectionItemList() {
    return [
      OptionssectionItemModel(
          favorite: ImageConstant.imgFavorite,
          sendMoney: "Send\nMoney",
          card: "To acc to acc"),
      OptionssectionItemModel(
          favorite: ImageConstant.imgFavoriteCyan400,
          sendMoney: "Receive\nMoney",
          card: "Manage Account"),
      OptionssectionItemModel(
          favorite: ImageConstant.imgRiExchangeDollarLine,
          sendMoney: "Money\nExchange",
          card: "Exchange Money"),
      OptionssectionItemModel(
          favorite: ImageConstant.imgMdiCreditCardClockOutline,
          sendMoney: "Pay\nBills",
          card: "Govt.paybills"),
      OptionssectionItemModel(
          favorite: ImageConstant.imgFrame11,
          sendMoney: "Bank To\nBank",
          card: "Send money"),
      OptionssectionItemModel(
          favorite: ImageConstant.imgBookmark,
          sendMoney: "Mobile\nPrepaid",
          card: "Recharge Mobile")
    ];
  }
}
