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
  const Base({super.key});

  @override
  _BaseState createState() => _BaseState();
}

class _BaseState extends State<Base> {
  int currentIndex = 0;


  @override
  Widget build(BuildContext context) {

  final List<Widget> _pages = [
    Home(onCartPressed: () {
        setState(() {
          currentIndex = 2;
        });
      }),
    Categories(onCartPressed: () {
        setState(() {
          currentIndex = 2;
        });
      }),
    Cart(),
    Profile(),
  ];


    return Scaffold(

      body: _pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.green,
        type: BottomNavigationBarType.fixed,
        iconSize: 26,
        elevation: 10,

        onTap: (int index) {
          setState(() {
            currentIndex = index;
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
