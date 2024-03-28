// ignore_for_file: must_be_immutable

part of 'history_bloc.dart';

/// Represents the state of History in the application.
class HistoryState extends Equatable {
  HistoryState({
    this.selectedDropDownValue,
    this.historyModelObj,
  });

  SelectionPopupModel? selectedDropDownValue;

  HistoryModel? historyModelObj;

  @override
  List<Object?> get props => [
        selectedDropDownValue,
        historyModelObj,
      ];

  HistoryState copyWith({
    SelectionPopupModel? selectedDropDownValue,
    HistoryModel? historyModelObj,
  }) {
    return HistoryState(
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      historyModelObj: historyModelObj ?? this.historyModelObj,
    );
  }
}
