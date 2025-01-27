/*
 * Copyright (c) 2020 .
 */

import 'dart:core';

import 'parents/model.dart';

class AvailabilityHour extends Model {
  String? day;
  String? startAt;
  String? endAt;
  String? data;

  AvailabilityHour({String? id, this.day, this.startAt, this.endAt, this.data}) {
    this.id = id;
  }

  AvailabilityHour.fromJson(Map<String, dynamic>? json) {
    super.fromJson(json);
    day = stringFromJson(json, 'day');
    startAt = stringFromJson(json, 'start_at');
    endAt = stringFromJson(json, 'end_at');
    data = transStringFromJson(json, 'data');
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'day': this.day,
      'start_at': this.startAt,
      'end_at': this.endAt,
      'data': this.data,
    };
  }
}