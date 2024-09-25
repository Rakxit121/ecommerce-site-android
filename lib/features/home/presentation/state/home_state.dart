import 'package:flutter/widgets.dart';
import 'package:scrubsnepal/features/cart/presentation/view/add_cart_view.dart';
import 'package:scrubsnepal/features/home/presentation/view/bottom_view/dashboard_view.dart';
import 'package:scrubsnepal/features/other/view/product_view.dart';
import 'package:scrubsnepal/features/other/view/profile_view.dart';

class HomeState {
  final int index;
  final List<Widget> lstWidgets;

  HomeState({required this.index, required this.lstWidgets});

  HomeState.initialState()
      : index = 0,
        lstWidgets = [
          const DashboardView(),
          const ProductsView(),
          // const FavouriteView(),
          AddCartView(),
          const ProfileView(),
        ];
  // CopyWith function to change the index no
  HomeState copyWith({
    int? index,
  }) {
    return HomeState(
      index: index ?? this.index,
      lstWidgets: lstWidgets,
    );
  }
}
