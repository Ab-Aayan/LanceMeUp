import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lancemeup/screen/Email/home_screen.dart';

import '../home.dart';
import 'Notification/NotificationTab.dart';
import 'Profile/ProfilePage.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const MyHomePage(),
    const SearchPage(),
    const EmailHome(),
    const NotificationPage(),
    const ProfilePage(),
  ];

  final List<IconData> _icons = [
    Icons.home,
    Icons.search,
    FontAwesomeIcons.envelope,
    Icons.notifications,
    Icons.person,
  ];

  final List<String> _names = [
    'Home',
    'Search',
    'Email',
    'Notification',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.white));
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: SizedBox(
        height: height * 0.1023,
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: List.generate(
            _icons.length,
            (index) {
              return BottomNavigationBarItem(
                icon: Icon(
                  _icons[index],
                  size: 27,
                ),
                label: _names[index],
              );
            },
          ),
          selectedItemColor: const Color.fromRGBO(124, 190, 100, 0.788),
        ),
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Search'),
    );
  }
}
