import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scrubsnepal/features/auth/data/model/auth_api_model.dart';
import 'package:scrubsnepal/features/auth/domain/entity/auth_entity.dart';

import '../../../../config/constants/api_endpoints.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/network/http_service.dart';

final authRemoteDatasourceProvider = Provider.autoDispose<AuthRemoteDatSource>(
  (ref) => AuthRemoteDatSource(
    dio: ref.read(httpServiceProvider),
  ),
);

class AuthRemoteDatSource {
  final Dio dio;
  AuthRemoteDatSource({required this.dio});

  Future<Either<Failure, bool>> addBatch(AuthEntity user) async {
    try {
      UserAPIModel batchAPIModel = UserAPIModel.fromEntity(user);
      var response = await dio.post(ApiEndpoints.createBatch,
          data: batchAPIModel.toJson());
      if (response.statusCode == 201) {
        return const Right(true);
      } else {
        return Left(Failure(
            error: response.statusMessage.toString(),
            statusCode: response.statusCode.toString()));
      }
    } on DioException catch (e) {
      return Left(Failure(error: e.response?.data['message']));
    }
  }
}
