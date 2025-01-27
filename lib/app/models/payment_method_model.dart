// ignore_for_file: non_nullable_equals_parameter



import 'media_model.dart';
import 'parents/model.dart';
import 'wallet_model.dart';

class PaymentMethod extends Model {
  String? name;
  String? description;
  Media? logo;
  String? route;
  int? order;
  bool isDefault = false;
  Wallet? wallet;

  PaymentMethod({String? id, this.name, this.description, this.route, this.wallet, this.isDefault = false, this.logo}) {
    this.id = id;
  }

  PaymentMethod.fromJson(Map<String, dynamic>? json) {
    super.fromJson(json);
    name = transStringFromJson(json, 'name');
    description = transStringFromJson(json, 'description');
    route = stringFromJson(json, 'route');
    logo = mediaFromJson(json, 'logo');
    order = intFromJson(json, 'order');
    isDefault = boolFromJson(json, 'default');
  }

  @override
  int get hashCode => super.hashCode ^ id.hashCode ^ name.hashCode ^ description.hashCode ^ route.hashCode ^ order.hashCode ^ wallet.hashCode;

  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
          super == other &&
              other is PaymentMethod &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              name == other.name &&
              description == other.description &&
              route == other.route &&
              order == other.order &&
              wallet == other.wallet;

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
