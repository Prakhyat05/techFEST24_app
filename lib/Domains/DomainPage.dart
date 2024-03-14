import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'package:json_annotation/json_annotation.dart';

import '../Services/Auth.dart' as auth;
import '../Services/Auth.dart';

part 'DomainPage.g.dart';

class DomainPage extends StatelessWidget {
  final Domain domain;

  const DomainPage({super.key, required this.domain});

  @override
  Widget build(BuildContext context) {
    Future<List<Event>> events = Event.getAll(domain);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(domain.domainName),
        ),
        body: FutureBuilder<List<Event>>(
            future: events,
            initialData: const [],
            builder:
                (BuildContext context, AsyncSnapshot<List<Event>> snapshot) {
              if (snapshot.data != null) {
                return const Text("No response from server");
              }
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (_, i) {
                    print(snapshot.data?[i]);
                    return DomainButton(
                        event: snapshot.data![i],
                        color:
                            Color(Random().nextInt(0xffffff)).withAlpha(0xff));
                  });
            }),
      ),
    );
  }
}

@JsonSerializable()
class Domain {
  @JsonKey(name: "_id")
  final String id;
  final String domainName;
  final String domainInfo;
  final List<String> facultyCoordinator;
  final List<String> studentCoordinator;
  final List<String> events;

  Domain(this.domainName, this.domainInfo, this.facultyCoordinator,
      this.studentCoordinator, this.events, this.id);

  static Future<List<Domain>> getAll() async {
    final resp =
        await http.get(Uri.parse("${auth.baseUrl}domain/getAllDomains"));
    print(resp.statusCode);
    print(resp.body);

    List<Domain> parsedResp;
    print((jsonDecode(resp.body) as List<dynamic>));
    print((jsonDecode(resp.body) as List<dynamic>).map((e) => Domain.fromJson(e)));
    try {
      parsedResp = (jsonDecode(resp.body) as List<dynamic>).map((e) => Domain.fromJson(e)).toList();
    } catch (err) {
      print(err);
      throw(err);
    }

    return parsedResp;
  }

  factory Domain.fromJson(Map<String, dynamic> json) => _$DomainFromJson(json);

  Map<String, dynamic> toJson() => _$DomainToJson(this);
}

@JsonSerializable()
class Event {
  @JsonKey(name: "_id")
  final String id;
  final String eventName;
  final String eventDescription;
  final String eventMode;
  final String venue;
  final String driveLink;
  final String domainName;
  final DateTime startDate;
  final String whatsappLink;
  final String eventParticipationLink;
  final bool registerationLive;
  final DateTime endDate;
  final List<User> individual;
  final List<User> studentCoordinator;
  final int techbucksReward;

  Event(
      this.eventName,
      this.eventDescription,
      this.eventMode,
      this.venue,
      this.driveLink,
      this.domainName,
      this.startDate,
      this.whatsappLink,
      this.eventParticipationLink,
      this.registerationLive,
      this.endDate,
      this.individual,
      this.studentCoordinator,
      this.techbucksReward,
      this.id);

  static Future<List<Event>> getAll(Domain domain) async {
    Request req =
        Request("POST", Uri.parse("${auth.baseUrl}event/getByDomain"));
    print("${auth.baseUrl}event/getByDomain");
    req.body = '{"domainId": "${domain.id}"}';
    req.headers["Content-Type"] = "application/json";
    final resp = await req.send();
    final bodyString = await resp.stream.bytesToString();
    print(bodyString);
    final parsedResp = jsonDecode(bodyString).data as List<Event>;
    return parsedResp;
  }

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  Map<String, dynamic> toJson() => _$EventToJson(this);
}

@JsonSerializable()
class Workshop {
  @JsonKey(name: "_id")
  final String id;
  final String workshopName;
  final String workshopDescription;
  final String workshopMode;
  final String workshopVenue;
  final String domainName;
  final DateTime startDate;
  final String whatsappLink;
  final String eventParticipationLink;
  final bool registerationLive;
  final String workshopTime;
  final List<User> user;
  final List<User> studentCoordinator;
  final int techbucksReward;

  Workshop(
      this.workshopName,
      this.workshopDescription,
      this.workshopMode,
      this.workshopVenue,
      this.domainName,
      this.startDate,
      this.whatsappLink,
      this.eventParticipationLink,
      this.registerationLive,
      this.workshopTime,
      this.user,
      this.studentCoordinator,
      this.techbucksReward,
      this.id);

  factory Workshop.fromJson(Map<String, dynamic> json) =>
      _$WorkshopFromJson(json);

  Map<String, dynamic> toJson() => _$WorkshopToJson(this);
}

@JsonSerializable()
class User {
  @JsonKey(name: "_id")
  final String id;
  final String name;
  final DateTime dob;
  final String email;
  final int phone;
  final int whatsappPhoneNumber;
  final String collegeName;
  final String regNo;
  final String course;
  final String branch;
  final String userId;
  final String isVerified;
  final List<Event> events;
  final List<Workshop> workshops;
  List<Event> eventsAttended = [];
  List<Workshop> workshopsAttended = [];
  int techbucks = 0;

  User(
      this.name,
      this.dob,
      this.email,
      this.phone,
      this.whatsappPhoneNumber,
      this.collegeName,
      this.regNo,
      this.course,
      this.branch,
      this.userId,
      this.isVerified,
      this.events,
      this.workshops,
      this.id);
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

class DomainButton extends StatelessWidget {
  final Event event;
  final Color color;

  const DomainButton({super.key, required this.event, required this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Add onPressed functionality here
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      child: Text(
        event.eventName,
        style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
