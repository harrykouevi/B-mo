/*
 * Copyright (c) 2020 .
 */

import 'dart:core';

import 'media_model.dart';
import 'parents/model.dart';

class Gallery extends Model {
  Media? image;
  String? description;

  Gallery({String? id, this.description, this.image}) {
    this.id = id;
  }

  Gallery.fromJson(Map<String, dynamic>? json) {
    super.fromJson(json);
    image = mediaFromJson(json, 'image');
    description = transStringFromJson(json, 'description');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    return data;
  }
}
