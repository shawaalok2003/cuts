import '../models/history_item_model.dart';
import 'package:flutter/material.dart';
import 'package:aalok_s_application3/core/app_export.dart';

// ignore: must_be_immutable
class HistoryItemWidget extends StatelessWidget {
  HistoryItemWidget(
    this.historyItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  HistoryItemModel historyItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              historyItemModelObj.month!,
              style: theme.textTheme.titleSmall,
            ),
            Text(
              historyItemModelObj.date!,
              style: CustomTextStyles.bodySmallGray500,
            ),
          ],
        ),
        SizedBox(height: 14.v),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              historyItemModelObj.amount!,
              style: theme.textTheme.bodyMedium,
            ),
            Padding(
              padding: EdgeInsets.only(left: 6.h),
              child: Text(
                historyItemModelObj.price!,
                style: CustomTextStyles.titleSmallBold,
              ),
            ),
            Spacer(),
            Text(
              historyItemModelObj.unpaid!,
              style: CustomTextStyles.labelLargeGreen600,
            ),
          ],
        ),
      ],
    );
  }
}
