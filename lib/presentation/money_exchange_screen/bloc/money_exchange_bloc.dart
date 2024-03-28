import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:aalok_s_application3/presentation/money_exchange_screen/models/money_exchange_model.dart';
part 'money_exchange_event.dart';
part 'money_exchange_state.dart';

/// A bloc that manages the state of a MoneyExchange according to the event that is dispatched to it.
class MoneyExchangeBloc extends Bloc<MoneyExchangeEvent, MoneyExchangeState> {
  MoneyExchangeBloc(MoneyExchangeState initialState) : super(initialState) {
    on<MoneyExchangeInitialEvent>(_onInitialize);
  }

  List<SelectionPopupModel> fillDropdownItemList() {
    return [
      SelectionPopupModel(
        id: 1,
        title: "Item One",
        isSelected: true,
      ),
      SelectionPopupModel(
        id: 2,
        title: "Item Two",
      ),
      SelectionPopupModel(
        id: 3,
        title: "Item Three",
      )
    ];
  }

  _onInitialize(
    MoneyExchangeInitialEvent event,
    Emitter<MoneyExchangeState> emit,
  ) async {
    emit(state.copyWith(
      inputsController: TextEditingController(),
      priceController: TextEditingController(),
    ));
    emit(state.copyWith(
        moneyExchangeModelObj: state.moneyExchangeModelObj?.copyWith(
      dropdownItemList: fillDropdownItemList(),
    )));
  }
}
