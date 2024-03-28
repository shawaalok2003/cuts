import '../../../core/app_export.dart';

/// This class is used in the [cards_item_widget] screen.
class CardsItemModel {
  CardsItemModel({
    this.jonathanAnderson,
    this.text,
    this.balance,
    this.price,
    this.id,
  }) {
    jonathanAnderson = jonathanAnderson ?? "Jonathan Anderson";
    text = text ?? "1222 3443 9881 1222";
    balance = balance ?? "Balance";
    price = price ?? " 31,250";
    id = id ?? "";
  }

  String? jonathanAnderson;

  String? text;

  String? balance;

  String? price;

  String? id;
}
