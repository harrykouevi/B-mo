import 'parents/model.dart';
import 'user_model.dart';

enum TransactionActions { CREDIT, DEBIT }

class WalletTransaction extends Model {
  double amount = 0;
  String? description;
  TransactionActions action = TransactionActions.CREDIT;
  DateTime? dateTime;
  User? user;

  WalletTransaction({
    String? id,
    this.amount = 0,
    this.description,
    this.action = TransactionActions.CREDIT,
    this.user,
    this.dateTime,
  }) {
    this.id = id;
  }

  WalletTransaction.fromJson(Map<String, dynamic>? json) {
    super.fromJson(json);
    description = stringFromJson(json, 'description');
    amount = doubleFromJson(json, 'amount') ?? 0;
    user = objectFromJson(json, 'user', (value) => User.fromJson(value));
    dateTime = dateFromJson(json, 'created_at', defaultValue: null);
    if (json != null) {
      if (json['action'] == 'credit') {
        action = TransactionActions.CREDIT;
      } else if (json['action'] == 'debit') {
        action = TransactionActions.DEBIT;
      }
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['amount'] = this.amount;
    data['description'] = this.description;
    data['action'] = this.action;
    data['user'] = this.user;
    return data;
  }
}
