// ignore_for_file: non_nullable_equals_parameter

import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../../common/uuid.dart';
import '../services/settings_service.dart';
import 'media_model.dart';
import 'parents/model.dart';

class User extends Model {
  String? name;
  String? email;
  String? password;
  Media avatar = Media();
  String? apiToken;
  String? deviceToken;
  String? phoneNumber;
  bool verifiedPhone = false;
  String? verificationId;
  String? address;
  String? bio;
  bool auth = false;

  User({
    String? id,
    this.name,
    this.email,
    this.password,
    this.apiToken,
    this.deviceToken,
    this.phoneNumber,
    this.verificationId,
    this.verifiedPhone = false,
    this.address,
    this.bio,
    Media? avatar,
    this.auth   = false,
  }) {
    this.avatar = avatar ?? Media();
    this.id = id;
  }

  User.fromJson(Map<String, dynamic>? json) {
    name = stringFromJson(json, 'name');
    email = stringFromJson(json, 'email');
    apiToken = stringFromJson(json, 'api_token');
    deviceToken = stringFromJson(json, 'device_token');
    phoneNumber = stringFromJson(json, 'phone_number');
    verifiedPhone = boolFromJson(json, 'phone_verified_at');
    avatar = mediaFromJson(json, 'avatar');
    auth = boolFromJson(json, 'auth');
    try {
      address = json?['custom_fields']['address']['view'];
    } catch (e) {
      address = stringFromJson(json, 'address');
    }
    try {
      bio = json?['custom_fields']['bio']['view'];
    } catch (e) {
      bio = stringFromJson(json, 'bio');
    }
    super.fromJson(json);
  }

  @override
  int get hashCode =>
      super.hashCode ^
      name.hashCode ^
      email.hashCode ^
      password.hashCode ^
      avatar.hashCode ^
      apiToken.hashCode ^
      deviceToken.hashCode ^
      phoneNumber.hashCode ^
      verifiedPhone.hashCode ^
      verificationId.hashCode ^
      address.hashCode ^
      bio.hashCode ^
      auth.hashCode;

  @override
  bool operator ==(dynamic other) =>
      super == other &&
      other is User &&
      runtimeType == other.runtimeType &&
      name == other.name &&
      email == other.email &&
      password == other.password &&
      avatar == other.avatar &&
      apiToken == other.apiToken &&
      deviceToken == other.deviceToken &&
      phoneNumber == other.phoneNumber &&
      verifiedPhone == other.verifiedPhone &&
      verificationId == other.verificationId &&
      address == other.address &&
      bio == other.bio &&
      auth == other.auth;

  PhoneNumber getPhoneNumber() {
    if (this.phoneNumber != null && this.phoneNumber!.length > 4) {
      this.phoneNumber = this.phoneNumber!.replaceAll(' ', '');
      String dialCode1 = this.phoneNumber!.substring(1, 2);
      String dialCode2 = this.phoneNumber!.substring(1, 3);
      String dialCode3 = this.phoneNumber!.substring(1, 4);
      for (int i = 0; i < countries.length; i++) {
        if (countries[i].dialCode == dialCode1) {
          return new PhoneNumber(countryISOCode: countries[i].code, countryCode: dialCode1, number: this.phoneNumber!.substring(2));
        } else if (countries[i].dialCode == dialCode2) {
          return new PhoneNumber(countryISOCode: countries[i].code, countryCode: dialCode2, number: this.phoneNumber!.substring(3));
        } else if (countries[i].dialCode == dialCode3) {
          return new PhoneNumber(countryISOCode: countries[i].code, countryCode: dialCode3, number: this.phoneNumber!.substring(4));
        }
      }
    }
    return new PhoneNumber(countryISOCode: Get.find<SettingsService>().setting.value.defaultCountryCode ?? '', countryCode: '1', number: '');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    if (password != null && password != '') {
      data['password'] = this.password;
    }
    data['api_token'] = this.apiToken;
    if (deviceToken != null) {
      data["device_token"] = deviceToken;
    }
    data["phone_number"] = phoneNumber;
    if (verifiedPhone) {
      data["phone_verified_at"] = DateTime.now().toLocal().toString();
    }
    data["address"] = address;
    data["bio"] = bio;
    if (Uuid.isUuid(avatar.id ?? '')) {
      data['avatar'] = this.avatar.id;
    }
    data["media"] = [avatar.toJson()];
    data['auth'] = this.auth;
    return data;
  }

  Map toRestrictMap() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["email"] = email;
    map["name"] = name;
    map["thumb"] = avatar.thumb;
    map["device_token"] = deviceToken;
    return map;
  }
}
