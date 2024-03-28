// ignore_for_file: must_be_immutable

part of 'add_person_bloc.dart';

/// Represents the state of AddPerson in the application.
class AddPersonState extends Equatable {
  AddPersonState({
    this.nameController,
    this.cardNumberController,
    this.saveOnList = false,
    this.addPersonModelObj,
  });

  TextEditingController? nameController;

  TextEditingController? cardNumberController;

  AddPersonModel? addPersonModelObj;

  bool saveOnList;

  @override
  List<Object?> get props => [
        nameController,
        cardNumberController,
        saveOnList,
        addPersonModelObj,
      ];

  AddPersonState copyWith({
    TextEditingController? nameController,
    TextEditingController? cardNumberController,
    bool? saveOnList,
    AddPersonModel? addPersonModelObj,
  }) {
    return AddPersonState(
      nameController: nameController ?? this.nameController,
      cardNumberController: cardNumberController ?? this.cardNumberController,
      saveOnList: saveOnList ?? this.saveOnList,
      addPersonModelObj: addPersonModelObj ?? this.addPersonModelObj,
    );
  }
}
