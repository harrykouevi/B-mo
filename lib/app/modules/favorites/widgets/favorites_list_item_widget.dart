/*
 * File name: favorites_list_item_widget.dart
 * Last modified: 2023.01.26 at 18:27:05
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2023
 */

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/ui.dart';
import '../../../models/favorite_model.dart';
import '../../../routes/app_routes.dart';
import '../../global_widgets/duration_chip_widget.dart';
import '../../global_widgets/salon_availability_badge_widget.dart';

class FavoritesListItemWidget extends StatelessWidget {
  const FavoritesListItemWidget({
    Key? key,
    required Favorite favorite,
  })  : _favorite = favorite,
        super(key: key);

  final Favorite _favorite;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.E_SERVICE, arguments: {'eService': _favorite.eService, 'heroTag': 'favorite_list_item_carousel' + (_favorite.id!)});
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: Ui.getBoxDecoration(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Hero(
                  tag: 'favorite_list_item_carousel' + _favorite.id! + _favorite.eService!.id!,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                    child: CachedNetworkImage(
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                      imageUrl: _favorite.eService!.firstImageUrl,
                      placeholder: (context, url) => Image.asset(
                        'assets/img/loading.gif',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 80,
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error_outline),
                    ),
                  ),
                ),
                SalonAvailabilityBadgeWidget(salon: _favorite.eService!.salon!, withImage: true)
              ],
            ),
            SizedBox(width: 12),
            Expanded(
              child: Wrap(
                runSpacing: 10,
                alignment: WrapAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Text(
                        _favorite.eService!.name ?? '',
                        style: Get.textTheme.bodyMedium,
                        maxLines: 3,
                        // textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                  Divider(height: 8, thickness: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DurationChipWidget(duration: _favorite.eService!.duration!),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          if (_favorite.eService!.getOldPrice > 0)
                            Ui.getPrice(
                              _favorite.eService!.getOldPrice,
                              style: Get.textTheme.titleLarge?.merge(TextStyle(color: Get.theme.focusColor, decoration: TextDecoration.lineThrough)),
                            ),
                          Ui.getPrice(
                            _favorite.eService!.getPrice,
                            style: Get.textTheme.titleLarge,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.business,
                        size: 18,
                        color: Get.theme.focusColor,
                      ),
                      SizedBox(width: 5),
                      Flexible(
                        child: Text(
                          _favorite.eService!.salon!.name!,
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          style: Get.textTheme.bodyLarge,
                        ),
                      ),
                    ],
                  ),
                  Divider(height: 8, thickness: 1),
                  Wrap(
                    spacing: 5,
                    children: List.generate(_favorite.options!.length, (index) {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        child: Text(_favorite.options!.elementAt(index).name!, style: Get.textTheme.bodySmall?.merge(TextStyle(fontSize: 10))),
                        decoration: BoxDecoration(
                            color: Get.theme.primaryColor,
                            border: Border.all(
                              color: Get.theme.focusColor.withOpacity(0.2),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                      );
                    }),
                    runSpacing: 5,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
