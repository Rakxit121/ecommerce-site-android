
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scrubsnepal/features/auth/domain/entity/auth_entity.dart';
import 'package:scrubsnepal/features/auth/presentation/state/auth_state.dart';

import '../../domain/use_case/register_usecase.dart';

final authViewModelProvider =
StateNotifierProvider.autoDispose<RegisterViewModel, AuthState>(
      (ref) => RegisterViewModel(
    registerUserUseCase: ref.read(registerUseCaseProvider),
    // getAllBatchUseCase: ref.read(getAllBatchUseCaseProvider),
  ),
);

class RegisterViewModel extends StateNotifier<AuthState> {
  final RegisterUserUseCase registerUserUseCase;
  // final GetAllBatchUseCase getAllBatchUseCase;

  RegisterViewModel({
    required this.registerUserUseCase,
    // required this.getAllBatchUseCase,
  }) : super(AuthState.initialState()){
    // getAllBatch();
  }

  void addBatch(AuthEntity batch) {
    state = state.copyWith(isLoading: true);
    registerUserUseCase.addBatch(batch).then((value) {
      value.fold(
            (failure) => state = state.copyWith(isLoading: false),
            (success) {
          state = state.copyWith(isLoading: false, showMessage: true);
          // getAllBatch();
        },
      );
    });
  }

  // void getAllBatch() {
  //   state = state.copyWith(isLoading: true);
  //   getAllBatchUseCase.getAllBatches().then((value) {
  //     value.fold(
  //           (failure) => state = state.copyWith(isLoading: false),
  //           (batches) {
  //         state = state.copyWith(isLoading: false, batches: batches);
  //       },
  //     );
  //   });
  // }

  void resetMessage(bool value) {
    state = state.copyWith(showMessage: value);
  }
}