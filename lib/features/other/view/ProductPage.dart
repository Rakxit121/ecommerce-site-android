import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductPage extends StatelessWidget {
  final Product product;

  ProductPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          product.name,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/clothes.png',
                        height: 200,
                        width: 200,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      product.name,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Text(
                      product.category,
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Text(
                      '\$${product.price}',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Description:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Product Description Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement your add to cart functionality here
              },
              child: Text("Add to Cart"),
            ),
          ],
        ),
      ),
    );
  }
}

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
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ProductPage(product: demoProducts[index]),
                ),
              );
            },
            child: Card(
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
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Price: \$${demoProducts[index].price}"),
                  ),
                ],
              ),
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

void main() {
  runApp(MaterialApp(
    home: AddCartView(),
  ));
}
