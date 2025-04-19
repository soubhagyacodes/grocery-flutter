import 'package:flutter/material.dart';



class Profile extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text("Profile"),
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
