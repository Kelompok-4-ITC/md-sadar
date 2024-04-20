import 'package:flutter/material.dart';
import 'package:sadar_app/views/screens/chat_screen.dart';
import 'package:sadar_app/views/screens/home_screen.dart';
import 'package:sadar_app/views/screens/process_screen.dart';
import 'package:sadar_app/views/screens/profile_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  static const List<Widget> _currentScreen = <Widget>[
    HomeScreen(),
    ProcessScreen(),
    ChatScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentScreen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _selectedIndex == 0 ? Colors.black : Colors.grey,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.delivery_dining,
              color: _selectedIndex == 1 ? Colors.black : Colors.grey,
            ),
            label: 'Process',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat_outlined,
              color: _selectedIndex == 2 ? Colors.black : Colors.grey,
            ),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_rounded,
              color: _selectedIndex == 3 ? Colors.black : Colors.grey,
            ),
            label: 'Profile',
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: /*const Color(0xFF79747E)*/Colors.black,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
    );
  }
}
