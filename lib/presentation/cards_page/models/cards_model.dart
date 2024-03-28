// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'cards_item_model.dart';

/// This class defines the variables used in the [cards_page],
/// and is typically used to hold data that is passed between different parts of the application.
class CardsModel extends Equatable {
  CardsModel({this.cardsItemList = const []}) {}

  List<CardsItemModel> cardsItemList;

  CardsModel copyWith({List<CardsItemModel>? cardsItemList}) {
    return CardsModel(
      cardsItemList: cardsItemList ?? this.cardsItemList,
    );
  }

  @override
  List<Object?> get props => [cardsItemList];
}
