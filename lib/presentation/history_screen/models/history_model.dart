// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:aalok_s_application3/core/app_export.dart';
import '../../../core/app_export.dart';
import 'history_item_model.dart';

/// This class defines the variables used in the [history_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class HistoryModel extends Equatable {
  HistoryModel({
    this.dropdownItemList = const [],
    this.historyItemList = const [],
  }) {}

  List<SelectionPopupModel> dropdownItemList;

  List<HistoryItemModel> historyItemList;

  HistoryModel copyWith({
    List<SelectionPopupModel>? dropdownItemList,
    List<HistoryItemModel>? historyItemList,
  }) {
    return HistoryModel(
      dropdownItemList: dropdownItemList ?? this.dropdownItemList,
      historyItemList: historyItemList ?? this.historyItemList,
    );
  }

  @override
  List<Object?> get props => [dropdownItemList, historyItemList];
}
