import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class EmptyPage extends StatelessWidget{
  final String title;

  const EmptyPage({super.key, required this.title});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.chevron_left_outlined), onPressed: (){Navigator.pop(context);},),
        centerTitle: true,
        title: Text(title, style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),),
        actionsPadding: EdgeInsets.all(10),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.android_outlined, size: 60),
            Text("Nothing Here", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),),
            Text("All Caught up", style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.grey),),
          ],
        ),
      ),
    );
  }
}