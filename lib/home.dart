import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/cart.dart';
import 'package:grocery_app/utils/home_categories.dart';
import 'package:grocery_app/utils/discounts.dart';
import 'package:grocery_app/utils/main_home_data.dart';
import 'package:grocery_app/utils/cart_items.dart';
import 'package:grocery_app/widgets/empty_page.dart';
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
  final Function onCartPressed;
  const Home({super.key, required this.onCartPressed});

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
              children: [
                IconButton(icon: Icon(Icons.notifications_none, size: 22), onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => EmptyPage(title: "Notifications",)));},),
                IconButton(icon: Icon(Icons.shopping_cart_outlined, size: 22), onPressed: (){onCartPressed();},),
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

class ProductDetails extends StatefulWidget{
  final Map<String, dynamic> product;
  const ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetails();
}

class _ProductDetails extends State<ProductDetails>{
  int counter = 0;

  @override
  Widget build(BuildContext context){
    

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.chevron_left_outlined), onPressed: (){Navigator.pop(context);},),
        centerTitle: true,
        title: Text("Details", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),),
        actions: [IconButton(onPressed: (){print(cart);}, icon: Icon(Icons.shopping_cart_outlined))],
        actionsPadding: EdgeInsets.all(10),
      ),
      body: ListView(
        children: [Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                      widget.product["image"], 
                      height: 250, 
                    )
              ),
              Container(
                padding: EdgeInsets.fromLTRB(25, 25, 25, 10),
                child: Column(
                  spacing: 7,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        spacing: 8,
                        children: [
                          Text(
                            widget.product["name"], 
                            style: GoogleFonts.poppins(fontSize: 30, fontWeight: FontWeight.w400)
                          ),
                          Icon(Icons.verified, color: Colors.green,)
                        ],
                      ),
                      Row(
                          spacing: 10,
                          children: [
                            Icon(Icons.favorite_outline_outlined, size: 20),
                            Icon(Icons.share_outlined, size: 20)
                          ],
                        ),
        
                  ],),
                  Text(
                    widget.product["price"], 
                    style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w700)
                  ),
        
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 12),
                    child: Column(
                      spacing: 8,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Description", style: GoogleFonts.poppins(fontSize: 15)),
                        Text(widget.product["description"],  style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey))
                      ],
                      
                    ),
                  )
                  
                  ],
                )
                )
          ],
        ),]
      ),
      bottomNavigationBar: Material(
        elevation: 20,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
          child: Row(
            spacing: 8,
            children: [
                  SizedBox(
                    height: 80,
                    child: Row(
                      spacing: 8,
                      children: [
                        IconButton(icon: Icon(Icons.remove), onPressed: (){setState(() {
                          counter != 0 ? counter--: 0;
                        });},),
                        Text(counter.toString(), style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w400)),
                        IconButton(icon: Icon(Icons.add), onPressed: (){setState(() {
                          counter++;
                        });},),
                      ],
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        if (counter == 0) return;
                        for (var cartItem in cart) {
                          if(cartItem["item"] == widget.product["name"]){
                            cartItem["quantity"] += counter;
                            Navigator.pop(context);
                            return;
                          }
                        }
                        cart.add({"quantity":counter , "item" : widget.product["name"], "description" : widget.product["description"], "image": widget.product["image"], "price" : widget.product["price"]});
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 20,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.green
                        ),
                        child: Center(child: Text("Add to Cart", style: GoogleFonts.poppins(fontWeight: FontWeight.w400, color: Colors.white))),
                      ),
                    ),
                  )
                ],
          ),
        ),
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
