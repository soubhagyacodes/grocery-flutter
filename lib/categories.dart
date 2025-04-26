import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/utils/category/all_cats.dart';
import 'package:grocery_app/utils/category/cat_products.dart';

class Categories extends StatelessWidget {
  final Function onCartPressed;
  const Categories({super.key, required this.onCartPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: ListView(
        children: [
          Stack(
            children: [
              Expanded(
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.elliptical(300, 80),
                      bottomRight: Radius.elliptical(300, 80),
                    ),
                  ),
                ),
              ),
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
                              padding: EdgeInsets.all(
                                12,
                              ), // Adjust space around the icon
                              child: Icon(Icons.search, size: 19),
                            ),
                            prefixIconConstraints: BoxConstraints(maxWidth: 30),
                            hintText: "Search...",
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 10,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide.none,
                            ),
                            focusColor: Colors.grey,
                          ),
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: (){onCartPressed();},
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        width: 40,
                        height: 40,
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200, // Background color
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ), // Rounded corners
                        ),
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.black54,
                          size: 21,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "All Categories",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromARGB(255, 20, 74, 23),
                  ),
                ),
                SizedBox(height: 13),
                Row(
                  spacing: 10,
                  children: [
                    Column(
                      spacing: 8,
                      children:
                          catData
                              .map(
                                (cat) => categorybox(
                                  context,
                                  cat["name"],
                                  cat["subline"],
                                  cat["image"],
                                ),
                              )
                              .take(5)
                              .toList(),
                    ),
                    Column(
                      spacing: 8,
                      children:
                          catData
                              .sublist(5, 10)
                              .map(
                                (cat) => categorybox(
                                  context,
                                  cat["name"],
                                  cat["subline"],
                                  cat["image"],
                                ),
                              )
                              .take(5)
                              .toList(),
                    ),
                  ],
                ),
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

Widget categorybox(
  BuildContext context,
  String? catName,
  String? subLine,
  String? imgPath,
) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CategoryPage(catName: catName,)),
      );
    },
    child: Container(
      width: 170,
      height: 110,
      padding: EdgeInsets.fromLTRB(13, 14, 10, 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                catName!,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.green.shade900,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                subLine!,
                style: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontSize: 9,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image(image: AssetImage(imgPath!), width: 50, height: 70),
            ],
          ),
        ],
      ),
    ),
  );
}

class CategoryPage extends StatelessWidget {
  final String catName;
  const CategoryPage({super.key, required this.catName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          "Shop",
          style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 17),
        ),
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.grey.shade100,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 30),
        children: [
          Text(
            catName,
            style: GoogleFonts.poppins(
              fontSize: 28,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10),
          StaggeredGrid.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: catpros[catName]!.map((item) => categoryProCont(item["image"] as String, item["name"] as String, item["quantity"] as String, item["price"] as int)).toList(),
          ),
        ],
      ),
    );
  }
}

Widget categoryProCont(String? img, String? name, String? quantity, int price) {
  return Expanded(
    child: Container(
      height: 230,
    
      padding: EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.elliptical(60, 20),
          bottomRight: Radius.elliptical(60, 20),
        ),
        boxShadow: [BoxShadow(color: Colors.black12, offset: Offset(0, 1))],
      ),
    
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(img!),
            height: 130,
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: Text(
                name!,
                maxLines: 1,
                overflow: TextOverflow.fade,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.green.shade900,
                ),
              ),
            ),
          ),
          Text(
            quantity!,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 11,
              color: Colors.grey,
            ),
          ),
          Spacer(),
          Text(
            "₹$price",
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    ),
  );
}
