import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/utils/home_categories.dart';

import '../categories.dart';

class HomeCategory extends StatelessWidget {
   final Map<String, dynamic> category;

   const HomeCategory({super.key, required this.category});

   @override
   Widget build(BuildContext context) {
    return Container(
      child: Column(
        spacing: 7,
        children: [
          InkWell(
            onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryPage(catName: category["text"])),);
            },
            child: SizedBox(
              height: 50,
              width: 50,
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.grey.shade300,
                child: Padding(
                  padding: EdgeInsets.all(6),
                  child: Image.asset(category["image"]),
                ),
              ),
            ),
          ),
          Text(
            category["text"],
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
