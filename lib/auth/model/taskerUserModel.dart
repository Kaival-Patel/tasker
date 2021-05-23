// To parse this JSON data, do
//
//     final taskerUser = taskerUserFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

TaskerUser taskerUserFromJson(String str) => TaskerUser.fromJson(json.decode(str));

String taskerUserToJson(TaskerUser data) => json.encode(data.toJson());

class TaskerUser {
    TaskerUser({
        this.createdAt,
        this.name,
        this.profilePic,
        this.status,
        this.userId,
        this.username,
    });

    Timestamp createdAt;
    String name;
    String profilePic;
    int status;
    String userId;
    String username;

    factory TaskerUser.fromJson(Map<String, dynamic> json) => TaskerUser(
        createdAt: json["created_at"] == null ? null : json["created_at"],
        name: json["name"] == null ? null : json["name"],
        profilePic: json["profile_pic"] == null ? null : json["profile_pic"],
        status: json["status"] == null ? null : json["status"],
        userId: json["user_id"] == null ? null : json["user_id"],
        username: json["username"] == null ? null : json["username"],
    );

    Map<String, dynamic> toJson() => {
        "created_at": createdAt == null ? null : createdAt,
        "name": name == null ? null : name,
        "profile_pic": profilePic == null ? null : profilePic,
        "status": status == null ? null : status,
        "user_id": userId == null ? null : userId,
        "username": username == null ? null : username,
    };
    Map<String, dynamic> createUser() => {
        "created_at": Timestamp.now(),
        "name": name == null ? null : name,
        "profile_pic": profilePic == null ? null : profilePic,
        "status": status == null ? null : status,
        "user_id": userId == null ? null : userId,
        "username": username == null ? null : username,
    };
}
