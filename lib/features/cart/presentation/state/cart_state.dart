import 'package:scrubsnepal/features/cart/domain/entity/course_entity.dart';

class CartState {
  final bool isLoading;
  final List<CartEntity> courses;

  CartState({
    required this.isLoading,
    required this.courses,
  });

  factory CartState.initialState() {
    return CartState(
      isLoading: false,
      courses: [],
    );
  }

  CartState copyWith({
    bool? isLoading,
    List<CartEntity>? courses,
  }) {
    return CartState(
      isLoading: isLoading ?? this.isLoading,
      courses: courses ?? this.courses,
    );
  }
}
