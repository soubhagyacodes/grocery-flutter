import 'package:flutter/material.dart';

class Cart extends StatelessWidget {

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
              Navigator.pop(context);
            }, 
            tooltip:'Back', 
            icon: Icon(Icons.arrow_back)
            ),
          );
  }
}
