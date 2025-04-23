import 'package:flutter/material.dart';
import 'package:grocery_app/utils/cart_items.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text("Cart"),
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
          ),
          body: ListView(
            children: [
              Container(
                child: Text("$cart"),
              )
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
