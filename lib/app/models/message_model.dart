// ignore_for_file: non_nullable_equals_parameter

import 'package:cloud_firestore/cloud_firestore.dart';

import 'parents/model.dart';
import 'user_model.dart';

class Message extends Model {
  // conversation name for example chat with market name
  String? name;

  // Chats messages
  String? lastMessage;
  int? lastMessageTime;

  // Ids of users that read the chat message
  List<String>? readByUsers;

  // Ids of users in this conversation
  List<String>? visibleToUsers;

  // users in the conversation
  List<User>? users;

  Message(this.users, {String? id, this.name = ''}) {
    this.id = id;
    visibleToUsers = this.users?.map((user) => user.id).cast<String>().toList();
    readByUsers = [];
  }

  Message.fromDocumentSnapshot(DocumentSnapshot jsonMap) {
    id = jsonMap.id;
    name = jsonMap.get('name')?.toString() ?? '';
    readByUsers = List.from(jsonMap.get('read_by_users') ?? []);
    visibleToUsers = List.from(jsonMap.get('visible_to_users') ?? []);
    lastMessage = jsonMap.get('message')?.toString() ?? '';
    lastMessageTime = jsonMap.get('time') ?? 0;
    users = (jsonMap.get('users') as List?)?.map((element) {
          element['media'] = [
            {'thumb': element['thumb']}
          ];
          return User.fromJson(element);
        }).toList() ??
        [];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "users": users?.map((element) => element.toRestrictMap()).toSet().toList(),
      "visible_to_users": users?.map((element) => element.id).toSet().toList(),
      "read_by_users": readByUsers,
      "message": lastMessage,
      "time": lastMessageTime,
    };
  }

  Map<String, dynamic> toUpdatedMap() {
    var map = new Map<String, dynamic>();
    map["message"] = lastMessage;
    map["time"] = lastMessageTime;
    map["read_by_users"] = readByUsers;
    return map;
  }

  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      super == other &&
          other is Message &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          lastMessage == other.lastMessage &&
          lastMessageTime == other.lastMessageTime &&
          readByUsers == other.readByUsers &&
          visibleToUsers == other.visibleToUsers &&
          users == other.users;

  @override
  int get hashCode =>
      super.hashCode ^
      id.hashCode ^
      name.hashCode ^
      lastMessage.hashCode ^
      lastMessageTime.hashCode ^
      readByUsers.hashCode ^
      visibleToUsers.hashCode ^
      users.hashCode;
}
