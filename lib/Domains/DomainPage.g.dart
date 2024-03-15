// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DomainPage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Domain _$DomainFromJson(Map<String, dynamic> json) => Domain(
      json['domainName'] as String,
      json['domainInfo'] as String,
      (json['facultyCoordinator'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      (json['studentCoordinator'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      (json['events'] as List<dynamic>).map((e) => e as String).toList(),
      json['_id'] as String,
    );

Map<String, dynamic> _$DomainToJson(Domain instance) => <String, dynamic>{
      '_id': instance.id,
      'domainName': instance.domainName,
      'domainInfo': instance.domainInfo,
      'facultyCoordinator': instance.facultyCoordinator,
      'studentCoordinator': instance.studentCoordinator,
      'events': instance.events,
    };

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      json['eventName'] as String,
      json['eventDescription'] as String,
      json['eventMode'] as String,
      json['venue'] as String,
      json['driveLink'] as String,
      json['domainName'] as String,
      DateTime.parse(json['startDate'] as String),
      json['whatsappLink'] as String,
      json['eventParticipationLink'] as String,
      json['registerationLive'] as bool,
      DateTime.parse(json['endDate'] as String),
      (json['individual'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['studentCoordinator'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['techbucksReward'] as int,
      json['_id'] as String,
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      '_id': instance.id,
      'eventName': instance.eventName,
      'eventDescription': instance.eventDescription,
      'eventMode': instance.eventMode,
      'venue': instance.venue,
      'driveLink': instance.driveLink,
      'domainName': instance.domainName,
      'startDate': instance.startDate.toIso8601String(),
      'whatsappLink': instance.whatsappLink,
      'eventParticipationLink': instance.eventParticipationLink,
      'registerationLive': instance.registerationLive,
      'endDate': instance.endDate.toIso8601String(),
      'individual': instance.individual,
      'studentCoordinator': instance.studentCoordinator,
      'techbucksReward': instance.techbucksReward,
    };

Workshop _$WorkshopFromJson(Map<String, dynamic> json) => Workshop(
      json['workshopName'] as String,
      json['workshopDescription'] as String,
      json['workshopMode'] as String,
      json['workshopVenue'] as String,
      json['domainName'] as String,
      DateTime.parse(json['startDate'] as String),
      json['whatsappLink'] as String,
      json['eventParticipationLink'] as String,
      json['registerationLive'] as bool,
      json['workshopTime'] as String,
      (json['user'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['studentCoordinator'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['techbucksReward'] as int,
      json['_id'] as String,
    );

Map<String, dynamic> _$WorkshopToJson(Workshop instance) => <String, dynamic>{
      '_id': instance.id,
      'workshopName': instance.workshopName,
      'workshopDescription': instance.workshopDescription,
      'workshopMode': instance.workshopMode,
      'workshopVenue': instance.workshopVenue,
      'domainName': instance.domainName,
      'startDate': instance.startDate.toIso8601String(),
      'whatsappLink': instance.whatsappLink,
      'eventParticipationLink': instance.eventParticipationLink,
      'registerationLive': instance.registerationLive,
      'workshopTime': instance.workshopTime,
      'user': instance.user,
      'studentCoordinator': instance.studentCoordinator,
      'techbucksReward': instance.techbucksReward,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['name'] as String,
      DateTime.parse(json['dob'] as String),
      json['email'] as String,
      json['phone'] as int,
      json['whatsappPhoneNumber'] as int,
      json['collegeName'] as String,
      json['regNo'] as String,
      json['course'] as String,
      json['branch'] as String,
      json['userId'] as String,
      json['isVerified'] as String,
      (json['events'] as List<dynamic>)
          .map((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['workshops'] as List<dynamic>)
          .map((e) => Workshop.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['_id'] as String,
    )
      ..eventsAttended = (json['eventsAttended'] as List<dynamic>)
          .map((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList()
      ..workshopsAttended = (json['workshopsAttended'] as List<dynamic>)
          .map((e) => Workshop.fromJson(e as Map<String, dynamic>))
          .toList()
      ..techbucks = json['techbucks'] as int;

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'dob': instance.dob.toIso8601String(),
      'email': instance.email,
      'phone': instance.phone,
      'whatsappPhoneNumber': instance.whatsappPhoneNumber,
      'collegeName': instance.collegeName,
      'regNo': instance.regNo,
      'course': instance.course,
      'branch': instance.branch,
      'userId': instance.userId,
      'isVerified': instance.isVerified,
      'events': instance.events,
      'workshops': instance.workshops,
      'eventsAttended': instance.eventsAttended,
      'workshopsAttended': instance.workshopsAttended,
      'techbucks': instance.techbucks,
    };
