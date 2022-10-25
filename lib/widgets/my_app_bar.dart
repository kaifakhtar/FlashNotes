import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppbar extends StatelessWidget {
  const MyAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 8.0),
         child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Container(
               decoration: BoxDecoration(
                 color: Colors.grey[300],
                 shape: BoxShape.circle
               ),
                 child: IconButton(
                     onPressed: (){
                     },
                     icon: Image.asset('asset/images/menu.png'))),
              Text("Flash Notes",
                style: GoogleFonts.alata(fontSize: 40),),
             Container(
                 decoration: BoxDecoration(
                   color: Colors.grey[300],
                   shape: BoxShape.circle
                 ),
                 child: IconButton(
                     onPressed: (){},
                     icon: Icon(Icons.person))),
           ],
         ),
       ),
    );
  }
}
