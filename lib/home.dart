import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/utils/home_categories.dart';
import 'package:grocery_app/utils/discounts.dart';
import 'package:grocery_app/utils/main_home_data.dart';
import 'styles.dart';
import 'package:grocery_app/widgets/home_category.dart';
import 'package:grocery_app/widgets/discount_box.dart';
import 'package:grocery_app/widgets/product_boxes.dart';

final bubbleData = [
  {
    "icon": Icons.location_on_outlined,
    "text": "Pickup"
  },
  {
    "icon": Icons.train_outlined,
    "text": "Delivery"
  },
  {
    "icon": Icons.local_offer_outlined,
    "text": "Deals"
  },
  {
    "icon": Icons.rate_review_outlined,
    "text": "Ratings"
  },
  {
    "icon": Icons.store_mall_directory_outlined,
    "text": "Stores"
  },
];

class Home extends StatelessWidget {
  const Home({super.key});

  @override
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
        scrollDirection: Axis.vertical,
        children: [
          Container(
            padding: const EdgeInsets.all(0),
            margin: EdgeInsets.fromLTRB(10, 8, 10, 0),
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
                  child: Icon(Icons.filter_list, color: Colors.black54, size: 20,),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
            margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
            height: 85,
            decoration: BoxDecoration(
              color: Colors.white
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  spacing: 18,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: homeCategories.map((singlecategory) => HomeCategory(category: singlecategory)).toList()
                ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 10,
                children: 
                  discounts.map((onediscount) => DiscountBox(discount: onediscount)).toList()
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(15, 15, 10, 0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 8,
                mainAxisAlignment: MainAxisAlignment.start,
                children: bubbleData.map((singlebubble) => bubble(singlebubble)).toList()
              ),
            ),
          ),
          ProductBoxes(products: fruits, title: "Fresh Fruits",),
          ProductBoxes(products: groceries, title: "Groceries",),
          ProductBoxes(products: snacks, title: "Healthy Snacks",)
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

Widget bubble(Map<String, dynamic> data) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10),
    height: 35,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: Colors.grey.shade400),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 1,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(data["icon"], size: 18),
        Text(
          data["text"],
          style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w600),
        ),
      ],
    ),
  );
}
