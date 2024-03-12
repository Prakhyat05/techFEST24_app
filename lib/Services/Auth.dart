import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:techfest_24/Domains/DomainPage.dart';

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
          body: jsonEncode(info));
      print(resp);
    } catch (err) {
      print(err);
      throw err;
    }
    if (resp.statusCode == 200) {
      final respParsed = jsonDecode(resp.body) as SigninResp;
      currentJwt = respParsed.token;
      try {
        resp = await http
            .post(Uri.parse("$baseUrl/getById/${respParsed.coordinatorId}"));
      } catch (err) {
        print(err);
        throw err;
      }
      currentUser = jsonDecode(resp.body) as Coordinator;
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

class SigninInfo {
  final String mail;
  final String pass;
  SigninInfo(this.mail, this.pass);
}

class SigninResp {
  final String token;
  final String coordinatorId;
  final String domain;

  SigninResp(this.token, this.coordinatorId, this.domain);
}

class SignupInfo {
  final String name;
  final String rank;
  final String mail;
  final String phone;
  final String branch;
  final String type;
  final String domain;

  SignupInfo(this.name, this.rank, this.mail, this.phone, this.branch,
      this.type, this.domain);

  Map<String, dynamic> toJson() => {
        "name": name,
        "rank": rank,
        "mail": mail,
        "phone": phone,
        "branch": branch,
        "type": type,
        "domain": domain,
      };
}

@JsonSerializable()
class Coordinator {
  @JsonKey(name: "_id")
  final String id;
  final String name;
  final String rank;
  final String mail;
  final String phone;
  final String branch;
  final String type;
  final String domain;

  Coordinator(this.name, this.rank, this.mail, this.phone, this.id, this.branch,
      this.type, this.domain);

  void verifyAttendance(User user) {}
}
