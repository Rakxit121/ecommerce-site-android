import 'package:flutter/material.dart';
import 'package:scrubsnepal/config/router/app_route.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  List<Product> products = List.generate(
    10,
    (index) => Product(
      id: index,
      name: 'Product $index',
      price: (index + 1) * 10.0,
      category: 'Category $index',
      imageUrl: 'assets/images/$index.png',
      isFavorite: false,
    ),
  );

  int itemsPerPage = 6;
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    List<Product> currentProducts = products
        .skip((currentPage - 1) * itemsPerPage)
        .take(itemsPerPage)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Explore",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
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
              // Navigator.push(context,
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: currentProducts.length + 1,
        itemBuilder: (context, index) {
          if (index == currentProducts.length) {
            // This is the last item, show a pagination button
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    currentPage++;
                  });
                },
                child: const Text('Load More'),
              ),
            );
          } else {
            return _buildProductCard(currentProducts[index]);
          }
        },
      ),
    );
  }

  Widget _buildProductCard(Product product) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          // Navigate to the product details page
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //       builder: (context) => ProductDetails(product: product)),
          // );
          // navigate to productpage
          Navigator.pushNamed(context, AppRoute.addressRoute);
        },
        child: ListTile(
          contentPadding: const EdgeInsets.all(16.0),
          leading: Hero(
            tag: 'product-image-${product.id}',
            child: Image.asset(
              product.imageUrl,
              width: 100.0,
              height: 100.0,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(product.name),
          subtitle: Text('${product.category} - \$${product.price}'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.red,
                ),
                onPressed: () {
                  // Toggle favorite status
                  setState(() {
                    product.isFavorite = !product.isFavorite;
                  });
                },
              ),
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  // Implement add to cart functionality
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Added ${product.name} to the cart'),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Product {
  final int id;
  final String name;
  final double price;
  final String category;
  final String imageUrl;
  bool isFavorite;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.imageUrl,
    this.isFavorite = false,
  });

  // String get imagePath => null;

  // String get imagePath => null;
}
