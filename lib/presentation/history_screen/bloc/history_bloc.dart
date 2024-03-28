import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/history_item_model.dart';
import 'package:aalok_s_application3/presentation/history_screen/models/history_model.dart';
part 'history_event.dart';
part 'history_state.dart';

/// A bloc that manages the state of a History according to the event that is dispatched to it.
class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc(HistoryState initialState) : super(initialState) {
    on<HistoryInitialEvent>(_onInitialize);
  }

  _onInitialize(
    HistoryInitialEvent event,
    Emitter<HistoryState> emit,
  ) async {
    emit(state.copyWith(
        historyModelObj: state.historyModelObj?.copyWith(
      dropdownItemList: fillDropdownItemList(),
      historyItemList: fillHistoryItemList(),
    )));
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

  List<HistoryItemModel> fillHistoryItemList() {
    return [
      HistoryItemModel(
          month: "October",
          date: "30/10/2020",
          amount: "Amount",
          price: "480",
          unpaid: "Paid"),
      HistoryItemModel(
          month: "November",
          date: "30/11/2020",
          amount: "Amount",
          price: "480",
          unpaid: "Unpaid"),
      HistoryItemModel(
          month: "December",
          date: "30/12/2020",
          amount: "Amount",
          price: "480",
          unpaid: "Paid"),
      HistoryItemModel(
          month: "January",
          date: "30/01/2021",
          amount: "Amount",
          price: "480",
          unpaid: "Pending"),
      HistoryItemModel(
          month: "January",
          date: "30/01/2021",
          amount: "Amount",
          price: "480",
          unpaid: "Pending"),
      HistoryItemModel(
          month: "January",
          date: "30/01/2021",
          amount: "Amount",
          price: "480",
          unpaid: "Pending"),
      HistoryItemModel(
          month: "January",
          date: "30/01/2021",
          amount: "Amount",
          price: "480",
          unpaid: "Pending"),
      HistoryItemModel(
          month: "January",
          date: "30/01/2021",
          amount: "Amount",
          price: "480",
          unpaid: "Pending")
    ];
  }
}
