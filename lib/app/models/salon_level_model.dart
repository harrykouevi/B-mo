/*
 * Copyright (c) 2020 .
 */

import 'dart:core';

import 'parents/model.dart';

class SalonLevel extends Model {

  String? _name;
  double? _commission;

  SalonLevel({String? id, String? name, double? commission}) {
    _name = name;
    _commission = commission;
    this.id = id;
  }

  SalonLevel.fromJson(Map<String, dynamic>? json) {
    super.fromJson(json);
    _name = transStringFromJson(json, 'name');
    _commission = doubleFromJson(json, 'commission');
  }

  String get name => _name ?? '';
  set name(String? value) {
    _name = value;
  }

  double get commission => _commission ?? 0.0;
  set commission(double? value) {
    _commission = value;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this._name;
    data['commission'] = this._commission;
    return data;
  }
}
