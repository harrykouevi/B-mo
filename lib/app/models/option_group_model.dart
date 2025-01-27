// ignore_for_file: non_nullable_equals_parameter

/*
 * File name: option_group_model.dart
 * Last modified: 2022.02.07 at 17:15:26
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2022
 */

import 'option_model.dart';
import 'parents/model.dart';

class OptionGroup extends Model {
  String? name;
  bool? allowMultiple;
  List<Option>? options;

  OptionGroup({String? id, this.name, this.allowMultiple, this.options}) {
    this.id = id;
  }

  OptionGroup.fromJson(Map<String, dynamic>? json, {eServiceId}) {
    super.fromJson(json);
    name = transStringFromJson(json, 'name');
    allowMultiple = boolFromJson(json, 'allow_multiple');
    options = listFromJson(json, 'options', (v) => Option.fromJson(v));
    if (eServiceId != null) {
      options!.removeWhere((element) => element.eServiceId != eServiceId);
    }
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "allow_multiple": allowMultiple,
    };
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      super == other &&
          other is OptionGroup &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          allowMultiple == other.allowMultiple &&
          options == other.options;

  @override
  int get hashCode => super.hashCode ^ id.hashCode ^ name.hashCode ^ allowMultiple.hashCode ^ options.hashCode;
}
