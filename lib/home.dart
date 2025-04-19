import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'styles.dart';

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 3,
              children: [
                Icon(Icons.location_on_outlined, size: 22, weight: 20),
                Text(
                  "1212/B, Mirpur, India",
                  style: GoogleFonts.poppins(textStyle: headingstyle),
                ),
              ],
            ),

            Row(
              spacing: 14,
              children: [
                Icon(Icons.notifications_none, size: 22, weight: 200),
                Icon(Icons.shopping_cart_outlined, size: 22, weight: 200),
              ],
            ),
          ],
        ),
        titleSpacing: 10,
        toolbarHeight: 50,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(7),
            child: Row(
              spacing: 5,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: TextField(
                      cursorHeight: 19,
                      cursorColor: Colors.green,
                      decoration: InputDecoration(
                        maintainHintHeight: true,
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(12), // Adjust space around the icon
                          child: Icon(Icons.search, size: 19),
                        ),
                        prefixIconConstraints: BoxConstraints(maxWidth: 30),
                        hintText: "Search...",
                        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide.none
                          ),
                        focusColor: Colors.grey
                      ),
                    ),
                  ),
                ),
            
                Container(
                  padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200, // Background color
                      borderRadius: BorderRadius.all(Radius.circular(30)), // Rounded corners
                    ),
                  child: Icon(Icons.filter_list, color: Colors.grey, size: 20,),
                )
              ],
            ),
          ),
        ],
      ),

      floatingActionButton: IconButton(
        onPressed: () {},
        tooltip: 'Back',
        icon: Icon(Icons.arrow_back),
      ),
    );
  }
}
