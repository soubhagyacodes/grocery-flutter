import 'package:flutter/material.dart';
import 'cart.dart';
import 'categories.dart';
import 'profile.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Grocery App',
      debugShowCheckedModeBanner: false,
      home: Home()
      )
    );
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text("Grocery"),
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
          ),
          body: ListView(

          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: 0,
            selectedItemColor: Colors.green,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                label: 'Home',
                icon: IconButton(
                  tooltip: 'Home',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                  },
                  icon: Icon(Icons.home),
                ),
                activeIcon: IconButton(
                  tooltip: 'Home',
                  onPressed: () {},
                  icon: Icon(Icons.home),
                ),
              ),
              BottomNavigationBarItem(
                label: 'Categories',
                icon: IconButton(
                  tooltip: 'Categories',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Categories()));
                  },
                  icon: Icon(Icons.category_outlined),
                ),
                activeIcon: IconButton(
                  tooltip: 'Categories',
                  onPressed: () {},
                  icon: Icon(Icons.category_rounded),
                ),
              ),
              BottomNavigationBarItem(
                label: 'Cart',
                icon: IconButton(
                  tooltip: 'Cart',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
                  },
                  icon: Icon(Icons.shopping_cart_outlined),
                ),
                activeIcon: IconButton(
                  tooltip: 'Cart',
                  onPressed: () {},
                  icon: Icon(Icons.shopping_cart_rounded),
                ),
              ),
              BottomNavigationBarItem(
                label: 'Profile',
                icon: IconButton(
                  tooltip: 'Profile',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
                  },
                  icon: Icon(Icons.person_outline),
                ),
                activeIcon: IconButton(
                  tooltip: 'Profile',
                  onPressed: () {},
                  icon: Icon(Icons.person),
                ),
              ),
            ],
          ),
          floatingActionButton: IconButton(
            onPressed:() {
            }, 
            tooltip:'Back', 
            icon: Icon(Icons.arrow_back)
            ),
          );
  }
}
