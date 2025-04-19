import 'package:flutter/material.dart';
import 'cart.dart';
import 'categories.dart';
import 'profile.dart';
import 'home.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Grocery App',
      debugShowCheckedModeBanner: false,
      home: Base(),
    ),
  );
}

class Base extends StatefulWidget {
  @override
  _BaseState createState() => _BaseState();
}

class _BaseState extends State<Base> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Home(),
    Categories(),
    Cart(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.green,
        type: BottomNavigationBarType.fixed,

        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },

        items: [

          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
          ),

          BottomNavigationBarItem(
            label: 'Categories',
            icon: Icon(Icons.category_outlined),
            activeIcon: Icon(Icons.category_rounded),
          ),

          BottomNavigationBarItem(
            label: 'Cart',
            icon: Icon(Icons.shopping_cart_outlined),
            activeIcon: Icon(Icons.shopping_cart_rounded),
          ),

          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
          ),

        ],
      ),
    );
  }
}
