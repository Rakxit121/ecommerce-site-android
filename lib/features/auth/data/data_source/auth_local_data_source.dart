import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scrubsnepal/features/auth/data/model/auth_hive_model.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/network/hive_service.dart';
import '../../domain/entity/auth_entity.dart';

final authLocalDataSourceProvider = Provider.autoDispose<AuthLocalDataSource>(
    (ref) => AuthLocalDataSource(hiveService: ref.read(hiveServiceProvider)));

class AuthLocalDataSource {
  final HiveService hiveService;

  AuthLocalDataSource({required this.hiveService});

  Future<Either<Failure, bool>> registerUser(AuthEntity user) async {
    try {
      AuthHiveModel batchHiveModel = AuthHiveModel.toHiveModel(user);
      hiveService.addBatch(batchHiveModel);
      return const Right(true);
    } catch (e) {
      return (Left(Failure(error: e.toString())));
    }
  }

  Future<Either<Failure, List<AuthEntity>>> getAllUser() async {
    try {
      List<AuthHiveModel> batches = await hiveService.getAllUsers();
      List<AuthEntity> list = List.generate(
          batches.length, (index) => AuthHiveModel.toEntity(batches[index]));
      return Right(list);
    } catch (e) {
      return (Left(Failure(error: e.toString())));
    }
  }

  Future<Either<Failure, bool>> loginUser(
    String username,
    String password,
  ) async {
    return const Right(true);
  }
}
