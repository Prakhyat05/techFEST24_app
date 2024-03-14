// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SigninInfo _$SigninInfoFromJson(Map<String, dynamic> json) => SigninInfo(
      json['email'] as String,
      json['password'] as String,
    );

Map<String, dynamic> _$SigninInfoToJson(SigninInfo instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

SigninResp _$SigninRespFromJson(Map<String, dynamic> json) => SigninResp(
      json['token'] as String,
      json['coordinatorId'] as String,
      json['coordinatorDomain'] as String,
      json['coordinatorRole'] as int,
    );

Map<String, dynamic> _$SigninRespToJson(SigninResp instance) =>
    <String, dynamic>{
      'token': instance.token,
      'coordinatorId': instance.coordinatorId,
      'coordinatorDomain': instance.coordinatorDomain,
      'coordinatorRole': instance.coordinatorRole,
    };

SignupInfo _$SignupInfoFromJson(Map<String, dynamic> json) => SignupInfo(
      name: json['name'] as String,
      mail: json['mail'] as String,
      phone: json['phone'] as String,
      branch: json['branch'] as String,
      type: json['type'] as String,
      domain: json['domain'] as String?,
      event: json['event'] as String?,
    );

Map<String, dynamic> _$SignupInfoToJson(SignupInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'mail': instance.mail,
      'phone': instance.phone,
      'branch': instance.branch,
      'type': instance.type,
      'domain': instance.domain,
      'event': instance.event,
    };

Coordinator _$CoordinatorFromJson(Map<String, dynamic> json) => Coordinator(
      json['coordinatorName'] as String,
      json['coordinatorEmail'] as String,
      json['coordinatorPhone'] as int,
      json['_id'] as String,
      json['coordinatorBranch'] as String,
      json['coordinatorType'] as String,
      json['coordinatorDomain'] as String,
    );

Map<String, dynamic> _$CoordinatorToJson(Coordinator instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'coordinatorName': instance.coordinatorName,
      'coordinatorEmail': instance.coordinatorEmail,
      'coordinatorPhone': instance.coordinatorPhone,
      'coordinatorBranch': instance.coordinatorBranch,
      'coordinatorType': instance.coordinatorType,
      'coordinatorDomain': instance.coordinatorDomain,
    };
