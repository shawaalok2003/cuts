// ignore_for_file: must_be_immutable

part of 'receive_money_personal_bloc.dart';

/// Represents the state of ReceiveMoneyPersonal in the application.
class ReceiveMoneyPersonalState extends Equatable {
  ReceiveMoneyPersonalState({
    this.firstNameController,
    this.lastNameInputFieldController,
    this.emailController,
    this.countryInputFieldController,
    this.currencyLabelController,
    this.amountInputController,
    this.massageInputController,
    this.receiveMoneyPersonalModelObj,
  });

  TextEditingController? firstNameController;

  TextEditingController? lastNameInputFieldController;

  TextEditingController? emailController;

  TextEditingController? countryInputFieldController;

  TextEditingController? currencyLabelController;

  TextEditingController? amountInputController;

  TextEditingController? massageInputController;

  ReceiveMoneyPersonalModel? receiveMoneyPersonalModelObj;

  @override
  List<Object?> get props => [
        firstNameController,
        lastNameInputFieldController,
        emailController,
        countryInputFieldController,
        currencyLabelController,
        amountInputController,
        massageInputController,
        receiveMoneyPersonalModelObj,
      ];

  ReceiveMoneyPersonalState copyWith({
    TextEditingController? firstNameController,
    TextEditingController? lastNameInputFieldController,
    TextEditingController? emailController,
    TextEditingController? countryInputFieldController,
    TextEditingController? currencyLabelController,
    TextEditingController? amountInputController,
    TextEditingController? massageInputController,
    ReceiveMoneyPersonalModel? receiveMoneyPersonalModelObj,
  }) {
    return ReceiveMoneyPersonalState(
      firstNameController: firstNameController ?? this.firstNameController,
      lastNameInputFieldController:
          lastNameInputFieldController ?? this.lastNameInputFieldController,
      emailController: emailController ?? this.emailController,
      countryInputFieldController:
          countryInputFieldController ?? this.countryInputFieldController,
      currencyLabelController:
          currencyLabelController ?? this.currencyLabelController,
      amountInputController:
          amountInputController ?? this.amountInputController,
      massageInputController:
          massageInputController ?? this.massageInputController,
      receiveMoneyPersonalModelObj:
          receiveMoneyPersonalModelObj ?? this.receiveMoneyPersonalModelObj,
    );
  }
}
