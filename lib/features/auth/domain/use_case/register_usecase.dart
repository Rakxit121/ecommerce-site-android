import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scrubsnepal/features/auth/domain/entity/auth_entity.dart';
import 'package:scrubsnepal/features/auth/domain/repository/auth_repository.dart';

import '../../../../core/failure/failure.dart';

final registerUseCaseProvider = Provider.autoDispose<RegisterUserUseCase>(
    (ref) => RegisterUserUseCase(repository: ref.read(authRepositoryProvider)));

class RegisterUserUseCase {
  final IAuthRepository repository;

  RegisterUserUseCase({required this.repository});

  Future<Either<Failure, bool>> addBatch(AuthEntity batch) async {
    return await repository.registerUser(batch);
  }


}
