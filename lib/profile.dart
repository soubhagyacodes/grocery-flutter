import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final profileList = [
  {
    "text": "My Orders",
    "icon": Icon(Icons.shopping_bag_outlined, color: Colors.grey.shade800, weight: 1,)
  },
  {
    "text": "Wishlist",
    "icon": Icon(Icons.favorite_border, color: Colors.grey.shade800,)
  },
  {
    "text": "Help and Support",
    "icon": Icon(Icons.help_center_outlined, color: Colors.grey.shade800,)
  },
  {
    "text": "FAQs",
    "icon": Icon(Icons.format_quote_outlined, color: Colors.grey.shade800,)
  },
  {
    "text": "Terms and Conditions",
    "icon": Icon(Icons.terminal_sharp, color: Colors.grey.shade800,)
  },
  {
    "text": "Privacy Policy",
    "icon": Icon(Icons.privacy_tip_outlined, color: Colors.grey.shade800,)
  },
  {
    "text": "Sign Out",
    "icon": Icon(Icons.outbond_outlined, color: Colors.grey.shade800,)
  },
];

class Profile extends StatelessWidget {
  const Profile({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text("Profile", style: GoogleFonts.poppins(fontSize: 23, fontWeight: FontWeight.w500),),
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
          ),
          body: ListView(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                width: double.infinity,
                height: 90,
                decoration: BoxDecoration(
                  color: Colors.white
                ),
                child: Row(
                  spacing: 13,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey.shade300,
                      child: Icon(Icons.person, color: Colors.grey.shade500, size: 40,),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Joseph Quinn", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500),),
                          Text("Show Profile", style: GoogleFonts.poppins(color: Colors.grey.shade600),),
                        ],
                      ),
                    ),
                    Icon(Icons.chevron_right_outlined)
                  ],
                ),
              ),
              Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text("Settings", style: GoogleFonts.poppins(color: Colors.grey.shade800),),
                  ),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  ...profileList.map(((box) => profileBox(box["text"] as String?, box["icon"] as Icon))).toList()],
                
                ),
              )
              
            ],
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

Widget profileBox(String? text, Icon icon){
  return Container(
                // padding: EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          icon,
                          SizedBox(width: 6,),
                          Text(text!, style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500)),
                          Spacer(),
                          Icon(Icons.chevron_right)
                        ],
                      ),
                    ),
                    Divider(color: Colors.grey.shade300,)
                  ],
                ),
              );
}
