import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppbar extends StatelessWidget {
  const MyAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: (MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top)*0.04,
                  decoration: BoxDecoration(
                      color: Colors.grey[300], shape: BoxShape.circle),
                  child: Center(
                    child: IconButton(
                      onPressed: () {},
                      icon: Image.asset('asset/images/menu.png'),
                      alignment: Alignment.center,
                    ),
                  )),
              const SizedBox(width: 4,),
              Text(
                "Flash Notes",
                style: GoogleFonts.montserrat(
                    fontSize: 20, fontWeight: FontWeight.bold,),
              ),
            ],
          ),

          Container(
            height:  (MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top)*0.04,
              decoration: BoxDecoration(
                  color: Colors.grey[300], shape: BoxShape.circle),
              child: FittedBox(child: IconButton(onPressed: () {}, icon: Icon(Icons.person)))),
        ],
      ),
    );
  }
}
