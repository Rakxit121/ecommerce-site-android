import 'package:scrubsnepal/features/auth/domain/entity/auth_entity.dart';

class AuthState {
  final bool isLoading;
  final List<AuthEntity> batches;
  final bool showMessage;

  AuthState({
    required this.isLoading,
    required this.batches,
    required this.showMessage,
  });

  factory AuthState.initialState() =>
      AuthState(isLoading: false, batches: [], showMessage: false);

  AuthState copyWith({
    bool? isLoading,
    List<AuthEntity>? batches,
    bool? showMessage,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      batches: batches ?? this.batches,
      showMessage: showMessage ?? this.showMessage,
    );
  }
}
