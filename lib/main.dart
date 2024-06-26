import 'package:flutter/material.dart';
import 'package:sadar_app/views/pages/main_page.dart';
import 'package:sadar_app/views/pages/login_page.dart';
import 'package:sadar_app/views/pages/register_page.dart';
import 'package:sadar_app/routes/route_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SADAR',
      routes: {
        RouteNames.login: (context) => const LoginPage(),
        RouteNames.register: (context) => const RegisterPage(),
        RouteNames.home: (context) => const MainPage(),
      },
      home: const CheckAuth(),
    );
  }
}

class CheckAuth extends StatefulWidget {
  const CheckAuth({super.key});

  @override
  State<CheckAuth> createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  bool isAuth = false;

  @override
  void initState() {
    super.initState();
    _checkLogin();
  }

  void _checkLogin() async {
    SharedPreferences local = await SharedPreferences.getInstance();
    var token = local.get('token');
    if (token != null) {
      if (mounted) {
        setState(
          () {
            isAuth = true;
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (isAuth) {
      child = const MainPage();
    } else {
      child = const LoginPage();
    }
    return child;
  }
}
