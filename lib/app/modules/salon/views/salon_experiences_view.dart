/*
 * File name: salon_experiences_view.dart
 * Last modified: 2023.01.26 at 18:29:48
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2023
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/salon_experiences_controller.dart';
import '../widgets/salon_til_widget.dart';

class SalonExperiencesView extends GetView<SalonExperiencesController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.experiences.isEmpty) {
        return SizedBox(height: 0);
      }
      return SalonTilWidget(
        title: Text("Experiences".tr, style: Get.textTheme.titleSmall),
        content: ListView.separated(
          padding: EdgeInsets.zero,
          primary: false,
          shrinkWrap: true,
          itemCount: controller.experiences.length,
          separatorBuilder: (context, index) {
            return Divider(height: 16, thickness: 0.8);
          },
          itemBuilder: (context, index) {
            var _experience = controller.experiences.elementAt(index);
            return Column(
              children: [
                Text(_experience.title ?? '').paddingSymmetric(vertical: 5),
                Text(
                  _experience.description ?? '',
                  style: Get.textTheme.bodySmall,
                ),
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            );
          },
        ),
      );
    });
  }
}
