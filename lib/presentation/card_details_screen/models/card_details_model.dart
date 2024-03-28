// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'carddetailslist_item_model.dart';

/// This class defines the variables used in the [card_details_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class CardDetailsModel extends Equatable {
  CardDetailsModel({this.carddetailslistItemList = const []}) {}

  List<CarddetailslistItemModel> carddetailslistItemList;

  CardDetailsModel copyWith(
      {List<CarddetailslistItemModel>? carddetailslistItemList}) {
    return CardDetailsModel(
      carddetailslistItemList:
          carddetailslistItemList ?? this.carddetailslistItemList,
    );
  }

  @override
  List<Object?> get props => [carddetailslistItemList];
}
