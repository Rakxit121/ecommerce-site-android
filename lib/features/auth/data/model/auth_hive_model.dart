// import 'package:ecommerce/features/auth/domain/entity/auth_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:scrubsnepal/features/auth/domain/entity/auth_entity.dart';
import 'package:uuid/uuid.dart';

import '../../../../config/constants/hive_table_constant.dart';

part 'auth_hive_model.g.dart';

@HiveType(typeId: HiveTableConstant.userTableId)
class AuthHiveModel {
  @HiveField(0)
  final String userId;

  @HiveField(1)
  final String firstName;

  @HiveField(2)
  final String lastName;

  @HiveField(3)
  final String dateOfBirth;

  @HiveField(4)
  final String phoneNumber;

  @HiveField(5)
  final String email;

  @HiveField(6)
  final String password;

  // Constructor

  // empty constructor
  AuthHiveModel.empty()
      : this(
          userId: '',
          firstName: '',
          lastName: '',
          dateOfBirth: '',
          phoneNumber: '',
          email: '',
          password: '',
        );
  AuthHiveModel({
    String? userId,
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.phoneNumber,
    required this.email,
    required this.password,
  }) : userId = userId ?? const Uuid().v4();

  static AuthEntity toEntity(AuthHiveModel hiveModel) => AuthEntity(
      userId: hiveModel.userId,
      firstName: hiveModel.firstName,
      lastName: hiveModel.lastName,
      dateOfBirth: hiveModel.dateOfBirth,
      email: hiveModel.email,
      phoneNumber: hiveModel.phoneNumber,
      password: hiveModel.password);

  // Convert Entity to Hive Object
  factory AuthHiveModel.toHiveModel(AuthEntity entity) => AuthHiveModel(
      // batchId: entity.batchId,
      firstName: entity.firstName,
      lastName: entity.lastName,
      dateOfBirth: entity.dateOfBirth,
      email: entity.email,
      password: entity.password,
      phoneNumber: entity.phoneNumber);
  @override
  String toString() {
    return 'userId: $userId, firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, email: $email, password: $password';
  }
}
