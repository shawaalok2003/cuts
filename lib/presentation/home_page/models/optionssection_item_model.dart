import '../../../core/app_export.dart';

/// This class is used in the [optionssection_item_widget] screen.
class OptionssectionItemModel {
  OptionssectionItemModel({
    this.favorite,
    this.sendMoney,
    this.card,
    this.id,
  }) {
    favorite = favorite ?? ImageConstant.imgFavorite;
    sendMoney = sendMoney ?? "Send\nMoney";
    card = card ?? "To acc to acc";
    id = id ?? "";
  }

  String? favorite;

  String? sendMoney;

  String? card;

  String? id;
}
