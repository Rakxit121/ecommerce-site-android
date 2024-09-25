import 'package:flutter/material.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  Color buttonColor = Colors.white;
  Color cartButtonColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Shop'),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildHomeHeader(),
            _buildHeader(),
            _buildProductList(),
          ],
        ),
      ),
    );
  }

  Widget _buildHomeHeader() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: SearchField()),
          SizedBox(width: 16),

          SizedBox(width: 8),
          // IconBtnWithCounter(
          //   svgSrc:
          //       "assets/icons/assetsiconsshopping-cart-supermarket-svgrepo-com.svg",
          //   numOfitem: 3,
          //   press: () {},
          // ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 450,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/glass.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            colors: [
              Colors.black.withOpacity(.8),
              Colors.black.withOpacity(.2),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: buttonColor,
                    ),
                    onPressed: () {
                      setState(() {
                        buttonColor = (buttonColor == Colors.white)
                            ? Colors.red
                            : Colors.white;
                      });
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.shopping_cart,
                    ),
                    color: cartButtonColor,
                    onPressed: () {
                      setState(() {
                        cartButtonColor = (cartButtonColor == Colors.white)
                            ? const Color.fromRGBO(169, 131, 108, 1)
                            : Colors.white;
                      });
                    },
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Our New Products",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: <Widget>[
                        Text(
                          "VIEW MORE",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 15,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductList() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            "Featured Products",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4, // Replace with the actual number of products
              itemBuilder: (context, index) {
                return _buildProductCard(
                  image: const AssetImage('assets/images/clothes.png'),
                  name: "Product ${index + 1}",
                  category: "Category ${index + 1}",
                  price: "\$${(index + 1) * 25}",
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard({
    required ImageProvider<Object> image,
    required String name,
    required String category,
    required String price,
  }) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            alignment: Alignment.topRight,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image(
                  image: image,
                  width: 150,
                  height: 120,
                  fit: BoxFit.fill,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: buttonColor,
                    ),
                    onPressed: () {
                      setState(() {
                        buttonColor = (buttonColor == Colors.white)
                            ? Colors.red
                            : Colors.white;
                      });
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.shopping_cart,
                    ),
                    color: cartButtonColor,
                    onPressed: () {
                      setState(() {
                        cartButtonColor = (cartButtonColor == Colors.white)
                            ? const Color.fromRGBO(169, 131, 108, 1)
                            : Colors.white;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(category),
          Text(price),
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        onChanged: (value) {},
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.withOpacity(0.1),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          border: searchOutlineInputBorder,
          focusedBorder: searchOutlineInputBorder,
          enabledBorder: searchOutlineInputBorder,
          hintText: "Search product",
          prefixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }
}

final searchOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(12),
  borderSide: BorderSide.none,
);

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
    required this.press,
  });

  final String title;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        TextButton(
          onPressed: press,
          style: TextButton.styleFrom(foregroundColor: Colors.grey),
          child: const Text("See more"),
        ),
      ],
    );
  }
}

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: SearchField()),
          SizedBox(width: 16),
          // IconBtnWithCounter(
          //   svgSrc: "assets/icons/Bell.svg",
          //   numOfitem: 3,
          //   press: () {},
          // ),
        ],
      ),
    );
  }
}

class IconBtnWithCounter extends StatelessWidget {
  const IconBtnWithCounter({
    super.key,
    required this.svgSrc,
    this.numOfitem = 0,
    required this.press,
  });

  final String svgSrc;
  final int numOfitem;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            height: 46,
            width: 46,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(229, 229, 229, 1),
              shape: BoxShape.circle,
            ),
            child: Image.asset(svgSrc),
          ),
          if (numOfitem != 0)
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: Center(
                  child: Text(
                    "$numOfitem",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
