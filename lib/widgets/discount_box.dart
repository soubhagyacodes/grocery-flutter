import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DiscountBox extends StatelessWidget {
  final Map<String, dynamic> discount;

  const DiscountBox({super.key, required this.discount});


  @override
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.fromLTRB(13, 15, 0, 15),
      width: 325,
      height: 145,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [discount["colors"]["from"], discount["colors"]["to"]]),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        children: [
          SizedBox(
            width: 145,
            child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(discount["text"], style: GoogleFonts.poppins(fontSize: 17, color: Colors.white, fontWeight: FontWeight.w400),),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Text("Shop Now", style: GoogleFonts.poppins(fontSize: 12,color:discount["colors"]["from"], fontWeight: FontWeight.w600),),
                  )
                ],
              ),
          ),
          Image.asset(discount["image"], width: 165,)
        ],
        ),
    );
  }
}