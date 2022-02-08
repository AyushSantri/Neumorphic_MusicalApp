import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';

class MusicPLayer extends StatelessWidget {
  const MusicPLayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Center(
              child: Text('Listen Now',
                  style: GoogleFonts.montserrat(
                      color: Colors.grey[800],
                      fontSize: 25,
                      fontWeight: FontWeight.w500)),
            ),
            const SizedBox(
              height: 65,
            ),
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height / 3.5,
                width: MediaQuery.of(context).size.height / 4.5,
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      const BoxShadow(
                          color: Colors.white,
                          offset: Offset(-4.0, -4.0),
                          blurRadius: 5.0,
                          spreadRadius: 3.0),
                      BoxShadow(
                          color: Colors.grey[400]!,
                          offset: const Offset(4.0, 4.0),
                          blurRadius: 5.0,
                          spreadRadius: 3.0)
                    ],
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://pbs.twimg.com/profile_images/1431129444362579971/jGrgSKDD_400x400.jpg'))),
              ),
            ),
            const SizedBox(
              height: 55,
            ),
            Text(
              'Arijit Singh',
              style: GoogleFonts.montserrat(
                  fontSize: 25, color: Colors.black87, letterSpacing: 0.7),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Dildara',
              style:
                  GoogleFonts.montserrat(fontSize: 20, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
