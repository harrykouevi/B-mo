import '../../common/uuid.dart';
import 'parents/model.dart';

class Wallet extends Model {
  String? name;
  double balance = 0;

  Wallet({String? id, this.name, this.balance = 0}) {
    this.id = id;
  }

  Wallet.fromJson(Map<String, dynamic>? json) {
    super.fromJson(json);
    name = stringFromJson(json, 'name');
    balance = doubleFromJson(json, 'balance') ?? 0;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      if (this.hasData) "id": id,
      if (name != null) "name": name,
      "balance": balance,
    };
  }

  String getId() {
    if (Uuid.isUuid(id ?? '')) {
      return id!.substring(0, 3) + ' . . . ' + id!.substring(id!.length - 5, id!.length);
    } else {
      return id!;
    }
  }
}
