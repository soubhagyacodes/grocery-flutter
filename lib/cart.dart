import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/utils/cart_items.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});


  @override
  Widget build(BuildContext context) {
    num total = 0;
    for (var item in cart) {
      String price = item["price"];
      total += item["quantity"] * int.parse(price.replaceAll(RegExp(r'[^0-9]'), ''));
    }
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
          appBar: AppBar(
            title: Text("Cart", style: GoogleFonts.poppins(),),
            backgroundColor: Colors.grey.shade100,
            automaticallyImplyLeading: false,
            
          ),
          body: ListView(
            children: [
              Container(
                child: cart.isEmpty ? 
                Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 190),
                    child: Column(
                      children: [
                        Image(image: AssetImage("images/empty_cart.png")),
                        SizedBox(height: 8,),
                        Text("The Cart is Empty", style: GoogleFonts.poppins(fontSize: 20),),
                        Text("You wouldn’t leave your cart like this, would you?", style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey),),
                      ],
                    ),
                  ),
                ) 
                : Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    spacing: 20,
                    children: [
                      Column(
                      spacing: 10,
                        children:
                         cart.map((item) => cartCard(item["image"], item["item"], item["description"], item["price"], item["quantity"])).toList()
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Sub-Total"),
                                Text("₹$total")
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Delivery Fee"),
                                Text("₹0")
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Taxes"),
                                Text("₹50")
                              ],
                            ),
                            SizedBox(height: 30,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Grand Total", style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.bold),),
                                Text("₹${total + 50}", style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),)
                              ],
                            ),
                            
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          cart.clear();
                          showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Payment Successful!', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
          content: Text('Your order has been placed successfully.', style: GoogleFonts.poppins()),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK', style: GoogleFonts.poppins(color: Colors.green)),
            ),
          ],
        );}
        
        );
                        },
                        child: Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child: Center(child: Text("Pay ₹${total + 50}", style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w600),)),
                        ),
                      )
                    ],
                  ),
                ),
                
              ),

            ],
          ),
          );
  }
}

Widget cartCard(String? img, String? itemName, String? itemDesc, String? price, int quantity){
  return  Container(
                            width: double.infinity,
                            height: 170,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: Row(
                              children: [
                                Image(image: AssetImage(img!), width: 130,),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(itemName!, style: GoogleFonts.poppins(fontSize: 20),),
                                          Container(
                                            width: 100,
                                            child: Text(itemDesc!, overflow: TextOverflow.ellipsis, maxLines: 1, style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey), textWidthBasis: TextWidthBasis.parent, )),]),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        spacing: 80,
                                        children: [
                                          Text(price!, style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),),
                                          Text("x $quantity", style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),),
                                        ],
                                      )
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          );
}