/*
 * File name: salon_model.dart
 * Last modified: 2024.04.16 at 19:02:51
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2024
 */

// ignore_for_file: non_nullable_equals_parameter

import 'dart:core';

import 'package:get/get.dart';

import '../services/global_service.dart';
import 'address_model.dart';
import 'availability_hour_model.dart';
import 'media_model.dart';
import 'parents/model.dart';
import 'review_model.dart';
import 'salon_level_model.dart';
import 'tax_model.dart';
import 'user_model.dart';

class Salon extends Model {
  String? name;
  String? description;
  List<Media>? images;
  String? phoneNumber;
  String? mobileNumber;
  SalonLevel? salonLevel;
  List<AvailabilityHour>? availabilityHours;
  double? availabilityRange;
  double? distance;
  bool? closed;
  bool? featured;
  Address? address;
  List<Tax>? taxes;
  List<User>? employees;
  double? rate;
  List<Review>? reviews;
  int? totalReviews;
  bool? verified;

  Salon({
    String? id,
    this.name,
    this.description,
    this.images,
    this.phoneNumber,
    this.mobileNumber,
    this.salonLevel,
    this.availabilityHours,
    this.availabilityRange,
    this.distance,
    this.closed,
    this.featured,
    this.address,
    this.taxes,
    this.rate,
    this.reviews,
    this.employees,
    this.totalReviews,
    this.verified,
  }) {
    this.id = id;
  }

  Salon.fromJson(Map<String, dynamic>? json) {
    super.fromJson(json);
    name = transStringFromJson(json, 'name');
    description = transStringFromJson(json, 'description');
    images = mediaListFromJson(json, 'images');
    phoneNumber = stringFromJson(json, 'phone_number');
    mobileNumber = stringFromJson(json, 'mobile_number');
    salonLevel = objectFromJson(json, 'salon_level', (v) => SalonLevel.fromJson(v));
    availabilityHours = listFromJson(json, 'availability_hours', (v) => AvailabilityHour.fromJson(v));
    availabilityRange = doubleFromJson(json, 'availability_range');
    distance = doubleFromJson(json, 'distance');
    closed = boolFromJson(json, 'closed');
    featured = boolFromJson(json, 'featured');
    address = objectFromJson(json, 'address', (v) => Address.fromJson(v));
    taxes = listFromJson(json, 'taxes', (v) => Tax.fromJson(v));
    employees = listFromJson(json, 'users', (v) => User.fromJson(v));
    rate = doubleFromJson(json, 'rate');
    reviews = listFromJson(json, 'salon_reviews', (v) => Review.fromJson(v));
    totalReviews = reviews!.isEmpty ? intFromJson(json, 'total_reviews') : reviews!.length;
    verified = boolFromJson(json, 'verified');
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'closed': closed,
      'phone_number': phoneNumber,
      'mobile_number': mobileNumber,
      'rate': rate,
      'total_reviews': totalReviews,
      'verified': verified,
      'distance': distance,
    };
  }

  String get firstImageUrl =>
      this.images != null && this.images!.isNotEmpty ? this.images!.first.url : "${Get.find<GlobalService>().baseUrl}images/image_default.png";
  String get firstImageIcon =>
      this.images != null && this.images!.isNotEmpty ? this.images!.first.icon : "${Get.find<GlobalService>().baseUrl}images/image_default.png";
  String get firstImageThumb =>
      this.images != null && this.images!.isNotEmpty ? this.images!.first.thumb : "${Get.find<GlobalService>().baseUrl}images/image_default.png";

  @override
  bool get hasData {
    return name != null && description != null;
  }

  Map<String, List<String>> groupedAvailabilityHours() {
    Map<String, List<String>> result = {};
    this.availabilityHours!.forEach((element) {
      if (result.containsKey(element.day)) {
        result[element.day]!.add(element.startAt! + ' - ' + element.endAt!);
      } else {
        result[element.day!] = [element.startAt! + ' - ' + element.endAt!];
      }
    });
    return result;
  }

  List<String> getAvailabilityHoursData(String day) {
    List<String> result = [];
    this.availabilityHours!.forEach((element) {
      if (element.day == day) {
        result.add(element.data!);
      }
    });
    return result;
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      super == other &&
          other is Salon &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          description == other.description &&
          images == other.images &&
          phoneNumber == other.phoneNumber &&
          mobileNumber == other.mobileNumber &&
          salonLevel == other.salonLevel &&
          availabilityRange == other.availabilityRange &&
          distance == other.distance &&
          closed == other.closed &&
          featured == other.featured &&
          address == other.address &&
          rate == other.rate &&
          reviews == other.reviews &&
          totalReviews == other.totalReviews &&
          verified == other.verified;

  @override
  int get hashCode =>
      super.hashCode ^
      id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      images.hashCode ^
      phoneNumber.hashCode ^
      mobileNumber.hashCode ^
      salonLevel.hashCode ^
      availabilityRange.hashCode ^
      distance.hashCode ^
      closed.hashCode ^
      featured.hashCode ^
      address.hashCode ^
      rate.hashCode ^
      reviews.hashCode ^
      totalReviews.hashCode ^
      verified.hashCode;
}
