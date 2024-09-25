import 'package:equatable/equatable.dart';

class CartEntity extends Equatable {
  final String? cartId;
  final String cartName;

  @override
  List<Object?> get props => [cartId, cartName];

  const CartEntity({
    this.cartId,
    required this.cartName,
  });

  @override
  String toString() {
    return 'CartEntity(cartId: $cartId, cartName: $cartName)';
  }
}
