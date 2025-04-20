import 'package:flutter/material.dart';



class Profile extends StatelessWidget {
  const Profile({super.key});


  @override
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
