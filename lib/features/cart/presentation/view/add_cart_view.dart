import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddCartView extends ConsumerWidget {
  AddCartView({super.key});

  final cartController = TextEditingController();
  final gap = const SizedBox(height: 8);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
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
      body: ListView.builder(
        itemCount: demoProducts.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                ListTile(
                  leading: Image.asset(
                    'assets/images/clothes.png',
                    width: 50,
                    height: 50,
                  ),
                  title: Text(demoProducts[index].name),
                  subtitle: Text(demoProducts[index].category),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Delete Confirmation"),
                            content: Text("Do you want to delete this item from the cart?"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("No"),
                              ),
                              TextButton(
                                onPressed: () {
                                  // Add logic to delete the item from the cart
                                  Navigator.of(context).pop();
                                },
                                child: Text("Yes"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Price: \$${demoProducts[index].price}"),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Confirm Purchase"),
                  content: Text("Do you want to confirm this purchase?"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("No"),
                    ),
                    TextButton(
                      onPressed: () {
                        // Add logic to confirm purchase
                        Navigator.of(context).pop();
                      },
                      child: Text("Yes"),
                    ),
                  ],
                );
              },
            );
          },
          child: Text("Purchase"),
        ),
      ),
    );
  }
}

// Sample product model
class Product {
  final String name;
  final String category;
  final double price;

  Product({required this.name, required this.category, required this.price});
}

// Sample list of products
List<Product> demoProducts = [
  Product(name: "Product 1", category: "Category 1", price: 20.0),
  Product(name: "Product 2", category: "Category 2", price: 25.0),
  Product(name: "Product 3", category: "Category 3", price: 30.0),
];
