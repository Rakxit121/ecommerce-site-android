import 'package:flutter/material.dart';
import 'package:scrubsnepal/config/router/app_route.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final int _selectedIndex =
      4; // Set the initially selected item to the "Profile" tab

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        // leading: IconButton(
        //   icon: const Icon(
        //     Icons.menu,
        //     color: Colors.black,
        //   ),
        //   onPressed: () {},
        // ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Image.asset(
              'assets/images/logo_brown.png', // Replace with the path to your logo image
              width: 60.0,
              height: 60.0,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "  My Profile",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/logo_brown.png'),
                ),
                SizedBox(width: 16), // Use `SizedBox` for spacing
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ra ra',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'ra@ra.com',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              // Navigate to the settings screen
              Navigator.pushNamed(context, AppRoute.settingRoute);
            },
          ),
          const Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Login/Sign Up'),
            onTap: () {
              // Navigate to the login
              Navigator.pushNamed(context, AppRoute.loginRoute);
            },
          ),
          const Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('My Orders'),
            onTap: () {
              // Navigate to the orders screen
            },
          ),
          const Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            leading: const Icon(Icons.location_on),
            title: const Text('Shipping Address'),
            onTap: () {
              // Navigate to the address screen
              Navigator.pushNamed(context, AppRoute.addressRoute);
            },
          ),
        ],
      ),
    );
  }
}
