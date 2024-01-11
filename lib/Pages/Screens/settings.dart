import 'package:flutter/material.dart';
import 'package:baby_milestones_tracker/Authentication/auth.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
              onPressed: () async {
                Navigator.pop(context);
                await _auth.signOut();
              },
              child: const Text('Logout'))),
    );
  }
}
