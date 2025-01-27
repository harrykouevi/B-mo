/*
 * File name: address_model.dart
 * Last modified: 2022.10.14 at 21:51:31
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2022
 */

import 'dart:math';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'parents/model.dart';

class Address extends Model {
  String? description;
  String? address;
  String? userId;
  double? latitude;
  double? longitude;
  bool isDefault = false;

  Address({this.description, this.address, this.latitude, this.longitude, this.userId, this.isDefault = false});

  Address.fromJson(Map<String, dynamic>? json) {
    super.fromJson(json);
    description = stringFromJson(json, 'description').replaceAll('\n', ' ');
    address = stringFromJson(json, 'address').replaceAll('\n', ' ');
    latitude = doubleFromJson(json, 'latitude', decimal: 10, defaultValue: null);
    longitude = doubleFromJson(json, 'longitude', decimal: 10, defaultValue: null);
    isDefault = boolFromJson(json, 'default');
    userId = stringFromJson(json, 'user_id');
  }

  LatLng getLatLng() => isUnknown() ? LatLng(38.806103, 52.4964453) : LatLng(latitude!, longitude!);

  String getDescription() {
    if (hasDescription()) return description!;
    return address!.substring(0, min(address!.length, 10));
  }

  bool hasDescription() => description != null && description!.isNotEmpty;

  bool isUnknown() => latitude == null || longitude == null;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (this.hasData) data['id'] = this.id;
    data['description'] = description;
    data['address'] = address;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['default'] = isDefault;
    data['user_id'] = userId;
    return data;
  }
}
