/*
 * File name: booking_summary_view.dart
 * Last modified: 2023.01.26 at 18:29:48
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2023
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' show DateFormat;

import '../../../../common/ui.dart';
import '../../../models/booking_model.dart';
import '../../../routes/app_routes.dart';
import '../../global_widgets/block_button_widget.dart';
import '../controllers/book_e_service_controller.dart';
import '../widgets/payment_details_widget.dart';

class BookingSummaryView extends GetView<BookEServiceController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Booking Summary".tr,
            style: context.textTheme.titleLarge,
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back_ios, color: Get.theme.hintColor),
            onPressed: () => Get.back(),
          ),
          elevation: 0,
        ),
        bottomNavigationBar: buildBottomWidget(controller.booking.value),
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              decoration: Ui.getBoxDecoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Booking At".tr, style: Get.textTheme.bodyLarge),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.calendar_today_outlined, color: Get.theme.focusColor),
                      SizedBox(width: 15),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${DateFormat.yMMMMEEEEd(Get.locale.toString()).format(controller.booking.value.bookingAt!)}', style: Get.textTheme.bodyMedium),
                          Text('${DateFormat('HH:mm', Get.locale.toString()).format(controller.booking.value.bookingAt!)}', style: Get.textTheme.bodyMedium),
                        ],
                      )),
                    ],
                  ),
                ],
              ),
            ),
            if (controller.booking.value.address == null)
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                decoration: Ui.getBoxDecoration(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(controller.booking.value.salon?.name ?? '', style: Get.textTheme.bodyLarge),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.place_outlined, color: Get.theme.focusColor),
                        SizedBox(width: 15),
                        Expanded(
                          child: Obx(() {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(controller.booking.value.salon?.address?.address ?? '', style: Get.textTheme.bodyMedium),
                              ],
                            );
                          }),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            if (controller.booking.value.address != null)
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                decoration: Ui.getBoxDecoration(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Your Address".tr, style: Get.textTheme.bodyLarge),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.place_outlined, color: Get.theme.focusColor),
                        SizedBox(width: 15),
                        Expanded(
                          child: Obx(() {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                if (controller.booking.value.address!.hasDescription())
                                  Text(controller.booking.value.address?.description ?? "Loading...".tr, style: Get.textTheme.titleSmall),
                                if (controller.booking.value.address!.hasDescription()) SizedBox(height: 10),
                                Text(controller.booking.value.address?.address ?? "Loading...".tr, style: Get.textTheme.bodyMedium),
                              ],
                            );
                          }),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            if (controller.booking.value.hint != null && controller.booking.value.hint != "")
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                decoration: Ui.getBoxDecoration(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("A Hint for the Provider".tr, style: Get.textTheme.bodyLarge),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.description_outlined, color: Get.theme.focusColor),
                        SizedBox(width: 15),
                        Expanded(
                          child: Obx(() {
                            return Text(controller.booking.value.hint ?? '', style: Get.textTheme.bodyMedium);
                          }),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          ],
        ));
  }

  Widget buildBottomWidget(Booking _booking) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Get.theme.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(color: Get.theme.focusColor.withOpacity(0.1), blurRadius: 10, offset: Offset(0, -5)),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PaymentDetailsWidget(booking: _booking),
          BlockButtonWidget(
              text: Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Confirm & Booking Now".tr,
                      textAlign: TextAlign.center,
                      style: Get.textTheme.titleLarge?.merge(
                        TextStyle(color: Get.theme.primaryColor),
                      ),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, color: Get.theme.primaryColor, size: 20)
                ],
              ),
              color: Get.theme.colorScheme.secondary,
              onPressed: () async {
                await Get.toNamed(Routes.CHECKOUT, arguments: _booking);
              }).paddingSymmetric(vertical: 10, horizontal: 20),
        ],
      ),
    );
  }
}
