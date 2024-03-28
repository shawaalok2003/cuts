// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'optionssection_item_model.dart';

/// This class defines the variables used in the [home_page],
/// and is typically used to hold data that is passed between different parts of the application.
class HomeModel extends Equatable {
  HomeModel({this.optionssectionItemList = const []}) {}

  List<OptionssectionItemModel> optionssectionItemList;

  HomeModel copyWith({List<OptionssectionItemModel>? optionssectionItemList}) {
    return HomeModel(
      optionssectionItemList:
          optionssectionItemList ?? this.optionssectionItemList,
    );
  }

  @override
  List<Object?> get props => [optionssectionItemList];
}
