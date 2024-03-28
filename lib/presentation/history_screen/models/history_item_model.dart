import '../../../core/app_export.dart';

/// This class is used in the [history_item_widget] screen.
class HistoryItemModel {
  HistoryItemModel({
    this.month,
    this.date,
    this.amount,
    this.price,
    this.unpaid,
    this.id,
  }) {
    month = month ?? "October";
    date = date ?? "30/10/2020";
    amount = amount ?? "Amount";
    price = price ?? "480";
    unpaid = unpaid ?? "Paid";
    id = id ?? "";
  }

  String? month;

  String? date;

  String? amount;

  String? price;

  String? unpaid;

  String? id;
}
