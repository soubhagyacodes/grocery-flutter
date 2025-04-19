import 'package:flutter/material.dart';


class Categories extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text("Categories"),
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
