import 'package:flutter/material.dart';
import 'package:scrubsnepal/features/home/presentation/view/bottom_view/shop_page_view.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favorites",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/images/logo_brown.png',
            width: 44.0,
            height: 44.0,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {
              // Implement your search functionality here
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {
              // Implement your cart functionality here
              // Navigator.pushNamed(context, AppRoute.AddCartView);
            },
          ),
        ],
      ),
      body:
          const ShopPage(), // Replace the placeholder with the ShopPage widget
    );
  }
}
