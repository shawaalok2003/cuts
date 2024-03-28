import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/profilelist1_item_model.dart';
import 'package:aalok_s_application3/presentation/mobile_prepaid_one_screen/models/mobile_prepaid_one_model.dart';
part 'mobile_prepaid_one_event.dart';
part 'mobile_prepaid_one_state.dart';

/// A bloc that manages the state of a MobilePrepaidOne according to the event that is dispatched to it.
class MobilePrepaidOneBloc
    extends Bloc<MobilePrepaidOneEvent, MobilePrepaidOneState> {
  MobilePrepaidOneBloc(MobilePrepaidOneState initialState)
      : super(initialState) {
    on<MobilePrepaidOneInitialEvent>(_onInitialize);
  }

  List<Profilelist1ItemModel> fillProfilelist1ItemList() {
    return [
      Profilelist1ItemModel(ellipse: ImageConstant.imgEllipse11),
      Profilelist1ItemModel(ellipse: ImageConstant.imgEllipse9),
      Profilelist1ItemModel(ellipse: ImageConstant.imgEllipse8),
      Profilelist1ItemModel(ellipse: ImageConstant.imgEllipse7),
      Profilelist1ItemModel(ellipse: ImageConstant.imgEllipse10)
    ];
  }

  _onInitialize(
    MobilePrepaidOneInitialEvent event,
    Emitter<MobilePrepaidOneState> emit,
  ) async {
    emit(state.copyWith(nameController: TextEditingController()));
    emit(state.copyWith(
        mobilePrepaidOneModelObj: state.mobilePrepaidOneModelObj
            ?.copyWith(profilelist1ItemList: fillProfilelist1ItemList())));
    NavigatorService.pushNamed(
      AppRoutes.enterMoneyScreen,
    );
  }
}
