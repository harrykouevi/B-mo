// ignore_for_file: non_nullable_equals_parameter

/*
 * File name: media_model.dart
 * Last modified: 2022.02.14 at 11:29:09
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2022
 */

import 'package:get/get.dart';

import '../services/global_service.dart';
import 'parents/model.dart';

class Media extends Model {
  String? name;
  String url = "${Get.find<GlobalService>().baseUrl}images/image_default.png";
  String thumb = "${Get.find<GlobalService>().baseUrl}images/image_default.png";
  String icon = "${Get.find<GlobalService>().baseUrl}images/image_default.png";
  String? size;

  Media({String? id, this.name, this.size, this.url = '', this.thumb = '', this.icon = ''}) {
    this.url = url.isEmpty ? "${Get.find<GlobalService>().baseUrl}images/image_default.png" : url;
    this.thumb = thumb.isEmpty ? "${Get.find<GlobalService>().baseUrl}images/image_default.png" : thumb;
    this.icon = icon.isEmpty ? "${Get.find<GlobalService>().baseUrl}images/image_default.png" : icon;
    this.id = id;
  }

  Media.fromJson(Map<String, dynamic> json) {
    super.fromJson(json);
    name = stringFromJson(json, 'name');
    url = stringFromJson(json, 'url', defaultValue: "${Get.find<GlobalService>().baseUrl}images/image_default.png");
    thumb = stringFromJson(json, 'thumb', defaultValue: "${Get.find<GlobalService>().baseUrl}images/image_default.png");
    icon = stringFromJson(json, 'icon', defaultValue: "${Get.find<GlobalService>().baseUrl}images/image_default.png");
    size = stringFromJson(json, 'formatted_size');
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "url": url,
      "thumb": thumb,
      "icon": icon,
      "formatted_size": size,
    };
  }

  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      super == other &&
          other is Media &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          url == other.url &&
          thumb == other.thumb &&
          icon == other.icon &&
          size == other.size;

  @override
  int get hashCode => super.hashCode ^ id.hashCode ^ name.hashCode ^ url.hashCode ^ thumb.hashCode ^ icon.hashCode ^ size.hashCode;
}
