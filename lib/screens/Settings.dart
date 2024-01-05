import 'package:flutter/material.dart';
import 'package:trivia_app/main.dart';

class Settings extends StatefulWidget {
  static String routeName = "/setting";
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 225, 247, 255),
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Column(
        children: <Widget>[
          // Account Logo at the top center
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(20.0),
            child: Icon(
              Icons.account_circle,
              size: 100.0, // Adjust the size as needed
              color: Colors.blue, // Adjust the color as needed
            ),
          ),
          // Button saying "Edit Profile"
          ElevatedButton(
            onPressed: () {
              // Handle "Edit Profile" button press
            },
            child: Text('Edit Profile'),
          ),
          // List of settings
          Expanded(
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: Text('Notification Settings'),
                  subtitle: Text('Configure notification preferences'),
                  leading: Icon(Icons.notifications),
                  onTap: () {
                    // Handle notification settings
                  },
                ),
                ListTile(
                  title: Text('Display Settings'),
                  subtitle: Text('Adjust display options'),
                  leading: Icon(Icons.desktop_windows),
                  onTap: () {
                    // Handle display settings
                  },
                ),
                ListTile(
                  title: Text('Preferences'),
                  subtitle: Text('Manage your preferences'),
                  leading: Icon(Icons.account_circle),
                  onTap: () {
                    // Handle account settings
                  },
                ),
              ],
            ),
          ),
          // Sign Out Button
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: ElevatedButton(
              onPressed: signout,
              child: Text('Sign Out'),
            ),
          ),
        ],
      ),
    );
  }

  void signout() {
    Navigator.pushReplacementNamed(context, Login.routeName);
    // Navigator.pop(context);
  }
}
