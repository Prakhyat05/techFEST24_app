import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:techfest_24/Domains/DomainPage.dart';

part "Auth.g.dart";

const baseUrl = "https://www.techfestsliet.org/api/";

class Auth {
  static Coordinator? currentUser;
  static String? currentJwt;
  SignUp(SignupInfo info) async {
    Response resp;
    try {
      resp = await http.post(Uri.parse("$baseUrl/coor/sign-up"),
          body: jsonEncode(info));
      print(resp);
      if (resp.statusCode != 200) {
        throw "Failed to authenticate";
      }
    } catch (err) {
      print(err);
    }
  }

  Future SignIn(SigninInfo info) async {
    Response resp;
    try {
      resp = await http.post(Uri.parse("$baseUrl/coor/sign-in"),
          body: info.toJson());
      print(resp.body);
    } catch (err) {
      print(err);
      throw err;
    }
    if (resp.statusCode == 200) {
      final respParsed = SigninResp.fromJson(jsonDecode(resp.body));
      currentJwt = respParsed.token;
      try {
        print("${baseUrl}coordinator/getById/${respParsed.coordinatorId}");
        resp = await http
            .get(Uri.parse("${baseUrl}coordinator/getById/${respParsed.coordinatorId}"));
      } catch (err) {
        print(err);
        throw err;
      }
      print(resp.body);
      print(jsonDecode(resp.body));
      currentUser = Coordinator.fromJson(jsonDecode(resp.body)["coordinator"]);
      print(currentUser);
    } else {
      throw "Failed to authenticate";
    }
  }

  Future<void> verifyAttendance(
      User user, Event? event, Workshop? workshop) async {
    final headers = {HttpHeaders.authorizationHeader: "Basic $currentJwt"};
    String payload;
    if (event != null) {
      payload = '{"eventId": ${event.id}}';
    } else if (workshop != null) {
      payload = '{"workshopId": ${workshop.id}}';
    } else {
      throw "Event and workshop are null";
    }
    final resp = await http.post(
        Uri.parse("$baseUrl/coordinator/verifyAttendance/$user.id"),
        headers: headers,
        body: payload);
    if (resp.statusCode != 200) {
      print(resp.body);
    }
  }
}

@JsonSerializable()
class SigninInfo {
  final String email;
  final String password;
  SigninInfo(this.email, this.password);
  factory SigninInfo.fromJson(Map<String, dynamic> json) =>
      _$SigninInfoFromJson(json);

  Map<String, dynamic> toJson() => _$SigninInfoToJson(this);
}

@JsonSerializable()
class SigninResp {
  final String token;
  final String coordinatorId;
  final String coordinatorDomain;
  final int coordinatorRole;

  SigninResp(this.token, this.coordinatorId, this.coordinatorDomain,
      this.coordinatorRole);

  factory SigninResp.fromJson(Map<String, dynamic> json) =>
      _$SigninRespFromJson(json);

  Map<String, dynamic> toJson() => _$SigninRespToJson(this);
}

@JsonSerializable()
class SignupInfo {
  final String name;
  final String mail;
  final String phone;
  final String branch;
  final String type;
  final String? domain;
  final String? event;

  SignupInfo(
      {required this.name,
      required this.mail,
      required this.phone,
      required this.branch,
      required this.type,
      this.domain,
      this.event});

  factory SignupInfo.fromJson(Map<String, dynamic> json) =>
      _$SignupInfoFromJson(json);

  Map<String, dynamic> toJson() => _$SignupInfoToJson(this);
}

@JsonSerializable()
class Coordinator {
  @JsonKey(name: "_id")
  final String id;
  final String coordinatorName;
  final String coordinatorEmail;
  final int coordinatorPhone;
  final String coordinatorBranch;
  final String coordinatorType;
  final String coordinatorDomain;

  Coordinator(this.coordinatorName, this.coordinatorEmail, this.coordinatorPhone, this.id, this.coordinatorBranch, this.coordinatorType,
      this.coordinatorDomain);

  factory Coordinator.fromJson(Map<String, dynamic> json) =>
      _$CoordinatorFromJson(json);

  Map<String, dynamic> toJson() => _$CoordinatorToJson(this);
}
