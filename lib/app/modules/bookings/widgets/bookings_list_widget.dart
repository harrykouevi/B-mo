/*
 * File name: bookings_list_widget.dart
 * Last modified: 2022.08.16 at 14:16:42
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2022
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../providers/laravel_provider.dart';
import '../../global_widgets/circular_loading_widget.dart';
import '../controllers/bookings_controller.dart';
import 'bookings_list_item_widget.dart';
import 'bookings_list_loader_widget.dart';

class BookingsListWidget extends GetView<BookingsController> {
  BookingsListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (Get.find<LaravelApiClient>().isLoading(task: 'getBookings') && controller.page.value == 1) {
        return BookingsListLoaderWidget();
      } else if (controller.bookings.isEmpty) {
        return CircularLoadingWidget(height: 300);
      } else {
        return ListView.builder(
          padding: EdgeInsets.only(bottom: 10, top: 10),
          primary: false,
          shrinkWrap: true,
          itemCount: controller.bookings.length + 1,
          itemBuilder: ((_, index) {
            if (index == controller.bookings.length) {
              return Obx(() {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Center(
                    child: new Opacity(
                      opacity: controller.isLoading.value ? 1 : 0,
                      child: new CircularProgressIndicator(),
                    ),
                  ),
                );
              });
            } else {
              var _booking = controller.bookings.elementAt(index);
              return BookingsListItemWidget(booking: _booking);
            }
          }),
        );
      }
    });
  }
}
