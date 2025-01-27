import 'package:get/get.dart';

import 'parents/model.dart';

class Notification extends Model {
  String? type;
  Map<String, dynamic> data = {};
  bool read = false;
  DateTime createdAt = DateTime.now().toLocal();

  Notification({String? id}) {
    this.id = id;
  }

  Notification.fromJson(Map<String, dynamic>? json) {
    super.fromJson(json);
    type = stringFromJson(json, 'type');
    data = mapFromJson(json, 'data', defaultValue: {});
    read = boolFromJson(json, 'read_at');
    createdAt = dateFromJson(json, 'created_at', defaultValue: DateTime.now().toLocal()) ?? DateTime.now().toLocal();
  }

  String getMessage() {
    if (type == 'App\\Notifications\\NewMessage' && data['from'] != null) {
      return '${data['from']} ${type?.tr}';
    } else if (data['booking_id'] != null) {
      return '#${data['booking_id']} ${type?.tr}';
    } else {
      return type!.tr;
    }
  }

  Map<String, dynamic> markReadMap() => {"id": id, "read_at": !read};

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}
