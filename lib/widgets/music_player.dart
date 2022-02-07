import 'package:flutter/material.dart';
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
            Center(
              child: Text('Listen Now',
                  style: GoogleFonts.montserrat(
                      color: Colors.grey[800],
                      fontSize: 25,
                      fontWeight: FontWeight.w500)),
            ),
          ],
        ),
      ),
    );
  }
}
