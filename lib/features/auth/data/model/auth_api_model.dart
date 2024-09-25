import 'dart:core';

import 'package:json_annotation/json_annotation.dart';
import 'package:scrubsnepal/features/auth/domain/entity/auth_entity.dart';

@JsonSerializable()
class UserAPIModel {
  @JsonKey(name: '_id')
  final String? userId;
  final String firstName;
  final String lastName;
  final String dateOfBirth;
  final String phoneNumber;
  final String email;
  final String password;

  UserAPIModel({
    this.userId,
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.phoneNumber,
    required this.email,
    required this.password,
  });

  factory UserAPIModel.fromJson(Map<String, dynamic> json) {
    return UserAPIModel(
        userId: json['userId'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        dateOfBirth: json['dateOfBirth'],
        email: json['email'],
        password: json['password'],
        phoneNumber: json['phoneNumber']);
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'firstName': firstName,
      'lastName': lastName,
      'dateOfBirth': dateOfBirth,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password
    };
  }

  // From entity to model
  factory UserAPIModel.fromEntity(AuthEntity entity) {
    return UserAPIModel(
        userId: entity.userId,
        firstName: entity.firstName,
        lastName: entity.lastName,
        dateOfBirth: entity.dateOfBirth,
        email: entity.email,
        password: entity.password,
        phoneNumber: entity.phoneNumber);
  }

  // From model to entity
  static AuthEntity toEntity(UserAPIModel model) {
    return AuthEntity(
        userId: model.userId,
        firstName: model.firstName,
        lastName: model.lastName,
        dateOfBirth: model.dateOfBirth,
        email: model.email,
        password: model.password,
        phoneNumber: model.phoneNumber);
  }
}
