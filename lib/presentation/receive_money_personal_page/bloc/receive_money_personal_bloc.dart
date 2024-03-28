import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:aalok_s_application3/presentation/receive_money_personal_page/models/receive_money_personal_model.dart';
part 'receive_money_personal_event.dart';
part 'receive_money_personal_state.dart';

/// A bloc that manages the state of a ReceiveMoneyPersonal according to the event that is dispatched to it.
class ReceiveMoneyPersonalBloc
    extends Bloc<ReceiveMoneyPersonalEvent, ReceiveMoneyPersonalState> {
  ReceiveMoneyPersonalBloc(ReceiveMoneyPersonalState initialState)
      : super(initialState) {
    on<ReceiveMoneyPersonalInitialEvent>(_onInitialize);
  }

  _onInitialize(
    ReceiveMoneyPersonalInitialEvent event,
    Emitter<ReceiveMoneyPersonalState> emit,
  ) async {
    emit(state.copyWith(
        firstNameController: TextEditingController(),
        lastNameInputFieldController: TextEditingController(),
        emailController: TextEditingController(),
        countryInputFieldController: TextEditingController(),
        currencyLabelController: TextEditingController(),
        amountInputController: TextEditingController(),
        massageInputController: TextEditingController()));
    NavigatorService.pushNamed(
      AppRoutes.requestSentScreen,
    );
  }
}
