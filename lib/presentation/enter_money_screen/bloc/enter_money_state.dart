// ignore_for_file: must_be_immutable

part of 'enter_money_bloc.dart';

/// Represents the state of EnterMoney in the application.
class EnterMoneyState extends Equatable {
  EnterMoneyState({
    this.messageController,
    this.enterMoneyModelObj,
  });

  TextEditingController? messageController;

  EnterMoneyModel? enterMoneyModelObj;

  @override
  List<Object?> get props => [
        messageController,
        enterMoneyModelObj,
      ];

  EnterMoneyState copyWith({
    TextEditingController? messageController,
    EnterMoneyModel? enterMoneyModelObj,
  }) {
    return EnterMoneyState(
      messageController: messageController ?? this.messageController,
      enterMoneyModelObj: enterMoneyModelObj ?? this.enterMoneyModelObj,
    );
  }
}
