import 'package:flutter/material.dart';

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
