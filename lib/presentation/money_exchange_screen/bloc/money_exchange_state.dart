// ignore_for_file: must_be_immutable

part of 'money_exchange_bloc.dart';

/// Represents the state of MoneyExchange in the application.
class MoneyExchangeState extends Equatable {
  MoneyExchangeState({
    this.inputsController,
    this.priceController,
    this.selectedDropDownValue,
    this.moneyExchangeModelObj,
  });

  TextEditingController? inputsController;

  TextEditingController? priceController;

  SelectionPopupModel? selectedDropDownValue;

  MoneyExchangeModel? moneyExchangeModelObj;

  @override
  List<Object?> get props => [
        inputsController,
        priceController,
        selectedDropDownValue,
        moneyExchangeModelObj,
      ];

  MoneyExchangeState copyWith({
    TextEditingController? inputsController,
    TextEditingController? priceController,
    SelectionPopupModel? selectedDropDownValue,
    MoneyExchangeModel? moneyExchangeModelObj,
  }) {
    return MoneyExchangeState(
      inputsController: inputsController ?? this.inputsController,
      priceController: priceController ?? this.priceController,
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      moneyExchangeModelObj:
          moneyExchangeModelObj ?? this.moneyExchangeModelObj,
    );
  }
}
