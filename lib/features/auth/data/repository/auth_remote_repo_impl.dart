import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scrubsnepal/core/failure/failure.dart';
import 'package:scrubsnepal/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:scrubsnepal/features/auth/domain/entity/auth_entity.dart';
import 'package:scrubsnepal/features/auth/domain/repository/auth_repository.dart';

final authRemoteRepositoryProvider = Provider.autoDispose<IAuthRepository>(
  (ref) => AuthRemoteRepoImpl(
    authRemoteDatSource: ref.read(authRemoteDatasourceProvider),
  ),
);

class AuthRemoteRepoImpl implements IAuthRepository {
  final AuthRemoteDatSource authRemoteDatSource;

  AuthRemoteRepoImpl({required this.authRemoteDatSource});
  @override
  Future<Either<Failure, bool>> loginUser(String username, String password) {
    // TODO: implement loginUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> registerUser(AuthEntity user) {
    return authRemoteDatSource.addBatch(user);
  }

  @override
  Future<Either<Failure, String>> uploadProfilePicture(File file) {
    // TODO: implement uploadProfilePicture
    throw UnimplementedError();
  }
}
