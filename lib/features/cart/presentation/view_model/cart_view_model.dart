// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:scrubsnepal/features/cart/domain/entity/course_entity.dart';
// import 'package:scrubsnepal/features/cart/presentation/state/cart_state.dart';

// final cartViewModelProvider =
//     StateNotifierProvider.autoDispose<CartViewModel, CartState>(
//   (ref) => CartViewModel(
//     getAllCartUsecase: ref.read(getAllUsecaseProvider),
//     addCartUsecase: ref.read(addCartUsecaseProvider),
//   ),
// );

// class CartViewModel extends StateNotifier<CartState> {
//   final GetAllCartUsecase getAllCartUsecase;
//   final AddCartUsecase addCartUsecase;

//   CartViewModel({
//     required this.getAllCartUsecase,
//     required this.addCartUsecase,
//   }) : super(CartState.initialState()) {
//     getAllCarts();
//   }

//   Future<void> getAllCarts() async {
//     state = state.copyWith(isLoading: true);
//     final result = await getAllCartUsecase();
//     result.fold(
//       (failure) => state = state.copyWith(isLoading: false),
//       (carts) => state = state.copyWith(isLoading: false, carts: carts),
//     );
//   }

//   Future<void> addCart(CartEntity cartEntity) async {
//     state = state.copyWith(isLoading: true);
//     final result = await addCartUsecase(cartEntity);
//     result.fold(
//       (failure) => state = state.copyWith(isLoading: false),
//       (isAdded) {
//         state = state.copyWith(isLoading: false);
//         getAllCarts();
//       },
//     );
//   }
// }
