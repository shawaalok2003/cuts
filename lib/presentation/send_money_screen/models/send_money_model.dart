// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'profilelist_item_model.dart';
import 'thirtyeight_item_model.dart';

/// This class defines the variables used in the [send_money_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class SendMoneyModel extends Equatable {
  SendMoneyModel({
    this.profilelistItemList = const [],
    this.thirtyeightItemList = const [],
  }) {}

  List<ProfilelistItemModel> profilelistItemList;

  List<ThirtyeightItemModel> thirtyeightItemList;

  SendMoneyModel copyWith({
    List<ProfilelistItemModel>? profilelistItemList,
    List<ThirtyeightItemModel>? thirtyeightItemList,
  }) {
    return SendMoneyModel(
      profilelistItemList: profilelistItemList ?? this.profilelistItemList,
      thirtyeightItemList: thirtyeightItemList ?? this.thirtyeightItemList,
    );
  }

  @override
  List<Object?> get props => [profilelistItemList, thirtyeightItemList];
}
