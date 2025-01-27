/*
 * File name: payment_details_widget.dart
 * Last modified: 2023.01.26 at 18:29:48
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2023
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/ui.dart';
import '../../../models/booking_model.dart';
import '../../bookings/widgets/booking_row_widget.dart';

class PaymentDetailsWidget extends StatelessWidget {
  const PaymentDetailsWidget({
    Key? key,
    required Booking booking,
  })  : _booking = booking,
        super(key: key);

  final Booking _booking;

  @override
  Widget build(BuildContext context) {
    List<Widget> _paymentDetails = [
      Column(
        children: List.generate(_booking.taxes?.length ?? 0, (index) {
          var _tax = _booking.taxes?.elementAt(index);
          return BookingRowWidget(
              description: _tax!.name ,
              child: Align(
                alignment: Alignment.centerRight,
                child: _tax.type == 'percent'
                    ? Text(_tax.value.toString() + '%', style: Get.textTheme.bodyLarge)
                    : Ui.getPrice(
                        _tax.value,
                        style: Get.textTheme.bodyLarge,
                      ),
              ),
              hasDivider: (_booking.taxes!.length - 1) == index);
        }),
      ),
      BookingRowWidget(
        description: "Tax Amount".tr,
        child: Align(
          alignment: Alignment.centerRight,
          child: Ui.getPrice(_booking.getTaxesValue(), style: Get.textTheme.titleSmall),
        ),
        hasDivider: false,
      ),
      BookingRowWidget(
          description: "Subtotal".tr,
          child: Align(
            alignment: Alignment.centerRight,
            child: Ui.getPrice(_booking.getSubtotal(), style: Get.textTheme.titleSmall),
          ),
          hasDivider: true),
      if ((_booking.coupon?.discount ?? 0) > 0)
        BookingRowWidget(
            description: "Coupon".tr,
            child: Align(
              alignment: Alignment.centerRight,
              child: Wrap(
                children: [
                  Text(' - ', style: Get.textTheme.bodyLarge),
                  Ui.getPrice(_booking.getCouponValue(), style: Get.textTheme.bodyLarge),
                ],
              ),
            ),
            hasDivider: true),
      BookingRowWidget(
        description: "Total Amount".tr,
        child: Align(
          alignment: Alignment.centerRight,
          child: Ui.getPrice(_booking.getTotal(), style: Get.textTheme.titleLarge),
        ),
      ),
    ];
    _booking.eServices!.forEach((_eService) {
      var _options = _booking.options!.where((option) => option.eServiceId == _eService.id);
      _paymentDetails.insert(
        0,
        Wrap(
          children: [
            BookingRowWidget(
              description: _eService.name!,
              child: Align(
                alignment: Alignment.centerRight,
                child: Ui.getPrice(_eService.getPrice, style: Get.textTheme.titleSmall),
              ),
              hasDivider: true,
            ),
            Column(
              children: List.generate(_options.length, (index) {
                var _option = _options.elementAt(index);
                return BookingRowWidget(
                    description: _option.name!,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Ui.getPrice(_option.price, style: Get.textTheme.bodyLarge),
                    ),
                    hasDivider: (_options.length - 1) == index);
              }),
            ),
          ],
        ),
      );
    });
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: _paymentDetails,
      ),
    );
  }
}
