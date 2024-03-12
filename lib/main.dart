import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sadar_app/pages/login_page.dart';
import 'package:sadar_app/pages/register_page.dart';
import 'package:sadar_app/routes/route_name.dart';

void main() {
  runApp(const GetMaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SADAR',
      initialRoute: RouteNames.login,
      routes: {
        RouteNames.login:(context) => const LoginPage(),
        RouteNames.register:(context) => const RegisterPage(),

      },
    );
  }
}
