// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:aalok_s_application3/core/app_export.dart';

/// This class defines the variables used in the [money_exchange_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class MoneyExchangeModel extends Equatable {
  MoneyExchangeModel({this.dropdownItemList = const []}) {}

  List<SelectionPopupModel> dropdownItemList;

  MoneyExchangeModel copyWith({List<SelectionPopupModel>? dropdownItemList}) {
    return MoneyExchangeModel(
      dropdownItemList: dropdownItemList ?? this.dropdownItemList,
    );
  }

  @override
  List<Object?> get props => [dropdownItemList];
}
