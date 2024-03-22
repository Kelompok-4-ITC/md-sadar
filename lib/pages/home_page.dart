import 'package:flutter/material.dart';
import 'package:sadar_app/routes/route_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            SharedPreferences local = await SharedPreferences.getInstance();
            local.remove('token');
            if (mounted) {
              Navigator.pushReplacementNamed(context, RouteNames.login);
            }
          },
          child: const Text('Log out'),
        ),
      ),
    );
  }
}
