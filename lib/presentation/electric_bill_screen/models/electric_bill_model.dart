// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'electricbill_item_model.dart';

/// This class defines the variables used in the [electric_bill_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ElectricBillModel extends Equatable {
  ElectricBillModel({this.electricbillItemList = const []}) {}

  List<ElectricbillItemModel> electricbillItemList;

  ElectricBillModel copyWith(
      {List<ElectricbillItemModel>? electricbillItemList}) {
    return ElectricBillModel(
      electricbillItemList: electricbillItemList ?? this.electricbillItemList,
    );
  }

  @override
  List<Object?> get props => [electricbillItemList];
}
