/*
 * File name: salon_item_widget.dart
 * Last modified: 2023.01.26 at 18:26:49
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2023
 */

import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/ui.dart';
import '../../../models/salon_model.dart';

class SalonItemWidget extends StatelessWidget {
  final Salon? salon;

  SalonItemWidget({Key? key, required this.salon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      runSpacing: 20,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: CachedNetworkImage(
                height: 65,
                width: 65,
                fit: BoxFit.cover,
                imageUrl: salon!.firstImageThumb,
                placeholder: (context, url) => Image.asset(
                  'assets/img/loading.gif',
                  fit: BoxFit.cover,
                  height: 65,
                  width: 65,
                ),
                errorWidget: (context, url, error) => Icon(Icons.error_outline),
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    salon!.name ?? '',
                    overflow: TextOverflow.fade,
                    softWrap: false,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.bodyMedium?.merge(TextStyle(color: Theme.of(context).hintColor)),
                  ),
                  SizedBox(height: 5),
                  Ui.removeHtml(
                    (salon!.description ?? '').substring(0, min((salon!.description ?? '').length, 50)),
                    style: Get.textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 32,
              child: Chip(
                padding: EdgeInsets.all(0),
                label: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(salon!.rate.toString(), style: Theme.of(context).textTheme.bodyLarge?.merge(TextStyle(color: Theme.of(context).primaryColor))),
                    Icon(
                      Icons.star_border,
                      color: Theme.of(context).primaryColor,
                      size: 16,
                    ),
                  ],
                ),
                backgroundColor: Get.theme.colorScheme.secondary.withOpacity(0.9),
                shape: StadiumBorder(),
              ),
            ),
          ],
        ),
        // Text(
        //   review.review,
        //   style: Theme.of(context).textTheme.bodySmall,
        //   overflow: TextOverflow.ellipsis,
        //   softWrap: false,
        //   maxLines: 3,
        // )
      ],
    );
  }
}
