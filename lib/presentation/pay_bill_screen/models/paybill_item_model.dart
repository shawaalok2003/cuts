import '../../../core/app_export.dart';

/// This class is used in the [paybill_item_widget] screen.
class PaybillItemModel {
  PaybillItemModel({
    this.electricityBill,
    this.electricityBill1,
    this.card,
    this.id,
  }) {
    electricityBill = electricityBill ?? ImageConstant.imgUserYellowA400;
    electricityBill1 = electricityBill1 ?? "Electricity\nBill";
    card = card ?? "Pay bill of this month";
    id = id ?? "";
  }

  String? electricityBill;

  String? electricityBill1;

  String? card;

  String? id;
}
