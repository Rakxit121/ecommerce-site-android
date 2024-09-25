import 'package:flutter/material.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Setting",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Image.asset(
              'assets/images/logo_brown.png',
              width: 60.0,
              height: 60.0,
            ),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('Notification Preferences'),
            onTap: () {
              // Navigate to notification settings screen
            },
          ),
          const Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            title: const Text('Privacy & Security'),
            onTap: () {
              // Navigate to privacy settings screen
            },
          ),
          const Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            title: const Text('Language'),
            onTap: () {
              // Navigate to language settings screen
            },
          ),
          const Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            title: const Text('About Us'),
            onTap: () {
              // Navigate to about us screen
            },
          ),
          const Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            title: const Text('Sign Out'),
            onTap: () {
              // Perform sign-out action
            },
          ),
          const Divider(
            height: 1,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
