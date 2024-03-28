// ignore_for_file: must_be_immutable

part of 'electric_bill_bloc.dart';

/// Represents the state of ElectricBill in the application.
class ElectricBillState extends Equatable {
  ElectricBillState({
    this.nameController,
    this.addressController,
    this.phoneController,
    this.inputsController,
    this.dateController,
    this.dateController1,
    this.electricBillModelObj,
  });

  TextEditingController? nameController;

  TextEditingController? addressController;

  TextEditingController? phoneController;

  TextEditingController? inputsController;

  TextEditingController? dateController;

  TextEditingController? dateController1;

  ElectricBillModel? electricBillModelObj;

  @override
  List<Object?> get props => [
        nameController,
        addressController,
        phoneController,
        inputsController,
        dateController,
        dateController1,
        electricBillModelObj,
      ];

  ElectricBillState copyWith({
    TextEditingController? nameController,
    TextEditingController? addressController,
    TextEditingController? phoneController,
    TextEditingController? inputsController,
    TextEditingController? dateController,
    TextEditingController? dateController1,
    ElectricBillModel? electricBillModelObj,
  }) {
    return ElectricBillState(
      nameController: nameController ?? this.nameController,
      addressController: addressController ?? this.addressController,
      phoneController: phoneController ?? this.phoneController,
      inputsController: inputsController ?? this.inputsController,
      dateController: dateController ?? this.dateController,
      dateController1: dateController1 ?? this.dateController1,
      electricBillModelObj: electricBillModelObj ?? this.electricBillModelObj,
    );
  }
}
