// ignore_for_file: must_be_immutable

part of 'add_card_one_bloc.dart';

/// Represents the state of AddCardOne in the application.
class AddCardOneState extends Equatable {
  AddCardOneState({
    this.nameController,
    this.cardNumberController,
    this.dateController,
    this.cvvController,
    this.saveMyCardDetails = false,
    this.addCardOneModelObj,
  });

  TextEditingController? nameController;

  TextEditingController? cardNumberController;

  TextEditingController? dateController;

  TextEditingController? cvvController;

  AddCardOneModel? addCardOneModelObj;

  bool saveMyCardDetails;

  @override
  List<Object?> get props => [
        nameController,
        cardNumberController,
        dateController,
        cvvController,
        saveMyCardDetails,
        addCardOneModelObj,
      ];

  AddCardOneState copyWith({
    TextEditingController? nameController,
    TextEditingController? cardNumberController,
    TextEditingController? dateController,
    TextEditingController? cvvController,
    bool? saveMyCardDetails,
    AddCardOneModel? addCardOneModelObj,
  }) {
    return AddCardOneState(
      nameController: nameController ?? this.nameController,
      cardNumberController: cardNumberController ?? this.cardNumberController,
      dateController: dateController ?? this.dateController,
      cvvController: cvvController ?? this.cvvController,
      saveMyCardDetails: saveMyCardDetails ?? this.saveMyCardDetails,
      addCardOneModelObj: addCardOneModelObj ?? this.addCardOneModelObj,
    );
  }
}
