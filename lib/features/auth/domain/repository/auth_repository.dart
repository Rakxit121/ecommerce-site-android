import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../../data/repository/auth_remote_repo_impl.dart';
import '../entity/auth_entity.dart';
final authRepositoryProvider = Provider.autoDispose<IAuthRepository>(
      (ref) => ref.read(authRemoteRepositoryProvider),
);
abstract class IAuthRepository {
  Future<Either<Failure, bool>> registerUser(AuthEntity user);
  Future<Either<Failure, bool>> loginUser(String username, String password);
  Future<Either<Failure, String>> uploadProfilePicture(File file);
}
