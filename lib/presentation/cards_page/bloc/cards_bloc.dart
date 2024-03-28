import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/cards_item_model.dart';
import 'package:aalok_s_application3/presentation/cards_page/models/cards_model.dart';
part 'cards_event.dart';
part 'cards_state.dart';

/// A bloc that manages the state of a Cards according to the event that is dispatched to it.
class CardsBloc extends Bloc<CardsEvent, CardsState> {
  CardsBloc(CardsState initialState) : super(initialState) {
    on<CardsInitialEvent>(_onInitialize);
  }

  _onInitialize(
    CardsInitialEvent event,
    Emitter<CardsState> emit,
  ) async {
    emit(state.copyWith(
        cardsModelObj:
            state.cardsModelObj?.copyWith(cardsItemList: fillCardsItemList())));
  }

  List<CardsItemModel> fillCardsItemList() {
    return [
      CardsItemModel(
          jonathanAnderson: "Jonathan Anderson",
          text: "1222 3443 9881 1222",
          balance: "Balance",
          price: " 31,250"),
      CardsItemModel(
          jonathanAnderson: "Jonathan Anderson",
          text: "1222 3443 9881 1222",
          balance: "Balance",
          price: " 31,250")
    ];
  }
}
