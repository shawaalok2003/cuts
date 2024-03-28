import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:aalok_s_application3/presentation/add_person_screen/models/add_person_model.dart';
part 'add_person_event.dart';
part 'add_person_state.dart';

/// A bloc that manages the state of a AddPerson according to the event that is dispatched to it.
class AddPersonBloc extends Bloc<AddPersonEvent, AddPersonState> {
  AddPersonBloc(AddPersonState initialState) : super(initialState) {
    on<AddPersonInitialEvent>(_onInitialize);
    on<ChangeCheckBoxEvent>(_changeCheckBox);
  }

  _changeCheckBox(
    ChangeCheckBoxEvent event,
    Emitter<AddPersonState> emit,
  ) {
    emit(state.copyWith(saveOnList: event.value));
  }

  _onInitialize(
    AddPersonInitialEvent event,
    Emitter<AddPersonState> emit,
  ) async {
    emit(state.copyWith(
        nameController: TextEditingController(),
        cardNumberController: TextEditingController(),
        saveOnList: false));
    NavigatorService.pushNamed(
      AppRoutes.addCardOneScreen,
    );
  }
}
