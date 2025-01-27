// ignore_for_file: non_nullable_equals_parameter

/*
 * File name: option_model.dart
 * Last modified: 2022.02.07 at 16:19:40
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2022
 */

import 'media_model.dart';
import 'parents/model.dart';

class Option extends Model {
  String? optionGroupId;
  String? eServiceId;
  String? name;
  double? price;
  Media? image;
  String? description;

  Option({
    String? id,
    this.optionGroupId,
    this.eServiceId,
    this.name,
    this.price,
    this.image,
    this.description,
  }) {
    this.id = id;
  }

  Option.fromJson(Map<String, dynamic>? json) {
    super.fromJson(json);
    optionGroupId = stringFromJson(json, 'option_group_id', defaultValue: '0');
    eServiceId = stringFromJson(json, 'e_service_id', defaultValue: '0');
    name = transStringFromJson(json, 'name');
    price = doubleFromJson(json, 'price');
    description = transStringFromJson(json, 'description');
    image = mediaFromJson(json, 'image');
  }

  Map<String, dynamic> toJson() {
    return {
      if (this.hasData) "id": id,
      if (name != null) "name": name,
      if (price != null) "price": price,
      if (description != null) "description": description,
      if (optionGroupId != null) "option_group_id": optionGroupId,
      if (eServiceId != null) "e_service_id": eServiceId,
      if (image != null) 'image': image!.toJson(),
    };
  }

  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      super == other &&
          other is Option &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          optionGroupId == other.optionGroupId &&
          eServiceId == other.eServiceId &&
          name == other.name &&
          price == other.price &&
          image == other.image &&
          description == other.description;

  @override
  int get hashCode => super.hashCode ^ id.hashCode ^ optionGroupId.hashCode ^ eServiceId.hashCode ^ name.hashCode ^ price.hashCode ^ image.hashCode ^ description.hashCode;
}
