import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../../../../core/failure/failure.dart';
import '../../domain/entity/auth_entity.dart';
import '../../domain/repository/auth_repository.dart';
import '../data_source/auth_local_data_source.dart';
final authLocalRepositoryImplProvider = Provider.autoDispose<IAuthRepository>(
        (ref) => AuthLocalRepositoryImpl(authLocalDataSource: ref.read(authLocalDataSourceProvider))
);
class AuthLocalRepositoryImpl implements IAuthRepository {
  final AuthLocalDataSource authLocalDataSource;

  AuthLocalRepositoryImpl({required this.authLocalDataSource});

  @override
  Future<Either<Failure, bool>> loginUser(String username, String password) {
    return authLocalDataSource.loginUser(username, password);
  }

  @override
  Future<Either<Failure, bool>> registerUser(AuthEntity user) {
    return authLocalDataSource.registerUser(user);
  }

  @override
  Future<Either<Failure, String>> uploadProfilePicture(File file) async {
    return const Right("");
  }
}
