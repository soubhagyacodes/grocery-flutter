import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductBoxes extends StatelessWidget{
  final List<Map<String, dynamic>> products;
  final String title;
  const ProductBoxes({super.key, required this.products, required this.title});

  @override
  Widget build(BuildContext context){
    return Container(
            margin: EdgeInsets.fromLTRB(15, 25, 15, 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600)),
                    Row(
                      spacing: 3,
                      children: [
                        Text("See All", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.green),),
                        Icon(Icons.arrow_right_alt_outlined, color: Colors.green,)
                      ],
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 10,
                      children: products.map((productdata)=> productBox(productdata)).toList(),
                    ),
                  ),
                )
              ],
            ),
          );
  }
}

Widget productBox(Map<String, dynamic> product) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Image.asset(product["image"], height: 130, width: 150,),
      SizedBox(height: 20),
      Text(
        product["price"],
        style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      Text(
        product["name"],
        style: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.grey,
        ),
      ),
      SizedBox(height: 3),
      Row(
        spacing: 4,
        children: [
          Icon(Icons.verified, size: 14, color: Colors.green),
          Text(
            "${product["stock"]}+ in Stock",
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: Colors.green,
            ),
          ),
        ],
      ),
    ],
  );
}
