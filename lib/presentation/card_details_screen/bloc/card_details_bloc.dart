import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/carddetailslist_item_model.dart';
import 'package:aalok_s_application3/presentation/card_details_screen/models/card_details_model.dart';
part 'card_details_event.dart';
part 'card_details_state.dart';

/// A bloc that manages the state of a CardDetails according to the event that is dispatched to it.
class CardDetailsBloc extends Bloc<CardDetailsEvent, CardDetailsState> {
  CardDetailsBloc(CardDetailsState initialState) : super(initialState) {
    on<CardDetailsInitialEvent>(_onInitialize);
  }

  _onInitialize(
    CardDetailsInitialEvent event,
    Emitter<CardDetailsState> emit,
  ) async {
    emit(state.copyWith(
        cardDetailsModelObj: state.cardDetailsModelObj?.copyWith(
      carddetailslistItemList: fillCarddetailslistItemList(),
    )));
  }

  List<CarddetailslistItemModel> fillCarddetailslistItemList() {
    return [
      CarddetailslistItemModel(
          cart: ImageConstant.imgCart,
          shopping: "Shopping",
          time: "3:41 pm",
          price: "-50.35"),
      CarddetailslistItemModel(
          cart: ImageConstant.imgMdiFood,
          shopping: "Food",
          time: "1:41 pm",
          price: "-10.00"),
      CarddetailslistItemModel(
          cart: ImageConstant.imgLinkedin,
          shopping: "Taxi",
          time: "10:00 am",
          price: "-15.00"),
      CarddetailslistItemModel(
          shopping: "Mahi", time: "6:46 pm", price: "+30.00"),
      CarddetailslistItemModel(
          shopping: "Adom", time: "6:46 pm", price: "+30.00")
    ];
  }
}
