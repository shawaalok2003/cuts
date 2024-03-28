import 'models/request_sent_model.dart';
import 'package:flutter/material.dart';
import 'package:aalok_s_application3/core/app_export.dart';
import 'bloc/request_sent_bloc.dart';

class RequestSentScreen extends StatelessWidget {
  const RequestSentScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<RequestSentBloc>(
      create: (context) => RequestSentBloc(RequestSentState(
        requestSentModelObj: RequestSentModel(),
      ))
        ..add(RequestSentInitialEvent()),
      child: RequestSentScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestSentBloc, RequestSentState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: SizedBox(
              width: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 80.adaptSize,
                    width: 80.adaptSize,
                    padding: EdgeInsets.symmetric(
                      horizontal: 29.h,
                      vertical: 31.v,
                    ),
                    decoration: AppDecoration.white.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder42,
                    ),
                    child: CustomImageView(
                      imagePath: ImageConstant.imgCheckmarkGray500,
                      height: 16.v,
                      alignment: Alignment.center,
                    ),
                  ),
                  SizedBox(height: 20.v),
                  SizedBox(
                    width: 148.h,
                    child: Text(
                      "msg_request_sent_successfully".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headlineSmall!.copyWith(
                        height: 1.50,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
