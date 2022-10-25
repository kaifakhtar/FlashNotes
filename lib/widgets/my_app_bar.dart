import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppbar extends StatelessWidget {
  const MyAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 35,
                    decoration: BoxDecoration(
                        color: Colors.grey[300], shape: BoxShape.circle),
                    child: Center(
                      child: IconButton(
                        onPressed: () {},
                        icon: Image.asset('asset/images/menu.png'),
                        alignment: Alignment.center,
                      ),
                    )),
                SizedBox(width: 4,),
                Text(
                  "Flash Notes",
                  style: GoogleFonts.openSans(
                      fontSize: 25, fontWeight: FontWeight.bold,),
                ),
              ],
            ),

            Container(
              height: 35,
                decoration: BoxDecoration(
                    color: Colors.grey[300], shape: BoxShape.circle),
                child: FittedBox(child: IconButton(onPressed: () {}, icon: Icon(Icons.person)))),
          ],
        ),
      ),
    );
  }
}
