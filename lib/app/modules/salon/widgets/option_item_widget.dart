/*
 * File name: option_item_widget.dart
 * Last modified: 2023.01.26 at 18:23:45
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2023
 */

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/ui.dart';
import '../../../models/e_service_model.dart';
import '../../../models/option_group_model.dart';
import '../../../models/option_model.dart';
import '../controllers/salon_e_services_controller.dart';

class OptionItemWidget extends GetWidget<SalonEServicesController> {
  OptionItemWidget({
    required Option option,
    required OptionGroup optionGroup,
    required EService eService,
  })  : _option = option,
        _optionGroup = optionGroup,
        _eService = eService;

  final Option _option;
  final EService _eService;
  final OptionGroup _optionGroup;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GestureDetector(
        onTap: () {
          controller.selectOption(_optionGroup, _option, _eService);
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: CachedNetworkImage(
                      height: 54,
                      width: 54,
                      fit: BoxFit.cover,
                      imageUrl: _option.image!.url,
                      placeholder: (context, url) => Image.asset(
                        'assets/img/loading.gif',
                        fit: BoxFit.cover,
                        height: 54,
                        width: 54,
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error_outline),
                    ),
                  ),
                  Container(
                    height: 54,
                    width: 54,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Get.theme.colorScheme.secondary.withOpacity(controller.isCheckedOption(_option) ? 0.8 : 0),
                    ),
                    child: Icon(
                      Icons.check,
                      size: 36,
                      color: Theme.of(context).primaryColor.withOpacity(controller.isCheckedOption(_option) ? 1 : 0),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 15),
              Flexible(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(_option.name!, style: controller.getTitleTheme(_option)).paddingOnly(bottom: 5),
                          Ui.applyHtml(_option.description, style: controller.getSubTitleTheme(_option)),
                        ],
                      ),
                    ),
                    SizedBox(width: 8),
                    Ui.getPrice(
                      _option.price,
                      style: Get.textTheme.titleLarge
                          ?.merge(TextStyle(color: controller.isCheckedOption(_option) ? Get.theme.colorScheme.secondary : Get.theme.hintColor)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
