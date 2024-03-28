// ignore_for_file: must_be_immutable

part of 'receive_money_request_bloc.dart';

/// Represents the state of ReceiveMoneyRequest in the application.
class ReceiveMoneyRequestState extends Equatable {
  ReceiveMoneyRequestState({
    this.firstNameController,
    this.lastNameController,
    this.emailController,
    this.nameController,
    this.countryController,
    this.amountController,
    this.inputsController,
    this.inputsController1,
    this.receiveMoneyRequestModelObj,
  });

  TextEditingController? firstNameController;

  TextEditingController? lastNameController;

  TextEditingController? emailController;

  TextEditingController? nameController;

  TextEditingController? countryController;

  TextEditingController? amountController;

  TextEditingController? inputsController;

  TextEditingController? inputsController1;

  ReceiveMoneyRequestModel? receiveMoneyRequestModelObj;

  @override
  List<Object?> get props => [
        firstNameController,
        lastNameController,
        emailController,
        nameController,
        countryController,
        amountController,
        inputsController,
        inputsController1,
        receiveMoneyRequestModelObj,
      ];

  ReceiveMoneyRequestState copyWith({
    TextEditingController? firstNameController,
    TextEditingController? lastNameController,
    TextEditingController? emailController,
    TextEditingController? nameController,
    TextEditingController? countryController,
    TextEditingController? amountController,
    TextEditingController? inputsController,
    TextEditingController? inputsController1,
    ReceiveMoneyRequestModel? receiveMoneyRequestModelObj,
  }) {
    return ReceiveMoneyRequestState(
      firstNameController: firstNameController ?? this.firstNameController,
      lastNameController: lastNameController ?? this.lastNameController,
      emailController: emailController ?? this.emailController,
      nameController: nameController ?? this.nameController,
      countryController: countryController ?? this.countryController,
      amountController: amountController ?? this.amountController,
      inputsController: inputsController ?? this.inputsController,
      inputsController1: inputsController1 ?? this.inputsController1,
      receiveMoneyRequestModelObj:
          receiveMoneyRequestModelObj ?? this.receiveMoneyRequestModelObj,
    );
  }
}
