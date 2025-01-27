// ignore_for_file: non_nullable_equals_parameter

/*
 * File name: review_model.dart
 * Last modified: 2022.02.10 at 17:46:03
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2022
 */
import 'booking_model.dart';
import 'parents/model.dart';

class Review extends Model {
  double? _rate;
  String? _review;
  DateTime? _createdAt;
  Booking? _booking;

  Review({String? id, double? rate, String? review, DateTime? createdAt, Booking? booking}) {
    _booking = booking;
    _createdAt = createdAt;
    _review = review;
    _rate = rate;
    this.id = id;
  }

  Review.fromJson(Map<String, dynamic>? json) {
    super.fromJson(json);
    _rate = doubleFromJson(json, 'rate');
    _review = stringFromJson(json, 'review');
    _createdAt = dateFromJson(json, 'created_at', defaultValue: DateTime.now().toLocal());
    _booking = objectFromJson(json, 'booking', (v) => Booking.fromJson(v));
  }


  double get rate => _rate ?? 0;
  set rate(double? value) => _rate = value;

  String get review => _review ?? '';
  set review(String? value) => _review = value;

  DateTime get createdAt => _createdAt ?? DateTime.now().toLocal() ;
  set createdAt(DateTime? value) => _createdAt = value;

  Booking get booking => _booking ?? Booking();
  set booking(Booking? value) => _booking = value;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['rate'] = this._rate;
    data['review'] = this._review;
    if (booking.hasData) {
      data['booking_id'] = booking.id;
    }
    return data;
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      super == other &&
          other is Review &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          rate == other.rate &&
          review == other.review &&
          createdAt == other.createdAt &&
          booking == other.booking;

  @override
  int get hashCode => super.hashCode ^ id.hashCode ^ rate.hashCode ^ review.hashCode ^ createdAt.hashCode ^ booking.hashCode;
}
