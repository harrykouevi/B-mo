import 'parents/model.dart';

class BookingStatus extends Model {
  String? status;
  int order = 0;

  BookingStatus({String? id, this.status, this.order = 0}) {
    this.id = id;
  }

  BookingStatus.fromJson(Map<String, dynamic>? json) {
    super.fromJson(json);
    status = transStringFromJson(json, 'status');
    order = intFromJson(json, 'order');
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['order'] = this.order;
    return data;
  }
}
