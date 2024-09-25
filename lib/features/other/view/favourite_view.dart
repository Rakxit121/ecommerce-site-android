import 'package:flutter/material.dart';
import 'package:scrubsnepal/features/other/view/product_view.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Product> demoProducts = []; // Initialize with your actual product data

    return SafeArea(
      child: Column(
        children: [
          AppBar(
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
                },
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: demoProducts.length,
              itemBuilder: (context, index) {
                return ProductCard(
                  image: const AssetImage('assets/images/clothes.png'),
                  name: demoProducts[index].name,
                  category: demoProducts[index].category,
                  price: demoProducts[index].price.toString(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final ImageProvider<Object> image;
  final String name;
  final String category;
  final String price;

  const ProductCard({
    super.key,
    required this.image,
    required this.name,
    required this.category,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(8),
      child: ListTile(
        leading: Image(image: image),
        title: Text(name),
        subtitle: Text(category),
        trailing: Text(price), // Displaying the price at the end
      ),
    );
  }
}
