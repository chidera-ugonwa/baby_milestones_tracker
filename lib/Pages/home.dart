import 'package:flutter/material.dart';
import '../Pages/Screens/categories_page.dart';
import '../Pages/Screens/settings.dart';
import '../Pages/Screens/dashboard.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  List pages = [const Dashboard(), const Categories(), const Settings()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        showSelectedLabels: false,
        selectedItemColor: Colors.blue,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
              label: '', icon: Icon(Icons.home_rounded, size: 32)),
          BottomNavigationBarItem(
              label: '', icon: Icon(Icons.category_rounded, size: 32)),
          BottomNavigationBarItem(
              label: '', icon: Icon(Icons.settings_rounded, size: 32)),
        ],
      ),
      body: pages.elementAt(_selectedIndex),
    );
  }
}
